green=`tput setaf 2`
reset=`tput sgr0`

VRD_ADDR="http://127.0.0.1"
PRI_PORT="8200"
PR_PORT="7200"
DR1_PORT="9200"
DR2_PORT="5200"

TOKEN1=$(cat PRI/root_token-vault_2)
TOKEN2=$(cat PR/root_token-vault_2)
TOKEN3=$(cat DR1/root_token-vault_2)
TOKEN4=$(cat DR2/root_token-vault_2)

function vaultpri { VAULT_TOKEN=$TOKEN1 VAULT_SKIP_VERIFY=true VAULT_ADDR=$VRD_ADDR:$PRI_PORT vault $@ ;} ; alias v1='vaultpri'
function vault1 { VAULT_TOKEN=$TOKEN1 VAULT_SKIP_VERIFY=true VAULT_ADDR=$VRD_ADDR:$PRI_PORT vault $@ ;}
function vaultdr1 { VAULT_TOKEN=$TOKEN3 VAULT_SKIP_VERIFY=true VAULT_ADDR=$VRD_ADDR:$DR1_PORT vault $@ ;} ; alias vdr1='vaultdr1'
function vaultpr { VAULT_SKIP_VERIFY=true VAULT_ADDR=$VRD_ADDR:$PR_PORT vault $@ ;} ; alias v3='vaultpr'
function vault2 { VAULT_TOKEN=$TOKEN2 VAULT_SKIP_VERIFY=true VAULT_ADDR=$VRD_ADDR:$PR_PORT vault $@ ;} ; alias v2='vault2'
function vaultdr2 { VAULT_TOKEN=$TOKEN4 VAULT_SKIP_VERIFY=true VAULT_ADDR=$VRD_ADDR:$DR2_PORT vault $@ ;} ; alias v4='vaultdr2'




# enable userpass auth
vault1 auth enable userpass
vault1 policy write admin admin_pol.hcl


# create user test
vault1 write auth/userpass/users/test password=test policies=admin


## enable DR replication
echo
echo "${green}COMMENT: enable replication DR primary"
echo

vault1 write -f sys/replication/dr/primary/enable
sleep 5
PRIMARY_DR_TOKEN=$(vault1 write -format=json sys/replication/dr/primary/secondary-token id=vaultdrrep | jq -r '.wrap_info .token')

echo
echo "${green}COMMENT: enable replication dr secondary"
echo
vaultdr1 write sys/replication/dr/secondary/enable token=${PRIMARY_DR_TOKEN}
sleep 10



##
## enable perf replication
echo
echo "${green}COMMENT: enable replication perf primary"
echo

vault1 write -f sys/replication/performance/primary/enable
sleep 5
PRIMARY_PERF_TOKEN=$(vault1 write -format=json sys/replication/performance/primary/secondary-token id=vault2rep | jq -r '.wrap_info .token')

echo
echo "${green}COMMENT: enable replication perf secondary"
echo
vault2 write sys/replication/performance/secondary/enable token=${PRIMARY_PERF_TOKEN}
sleep 20
echo "${green}COMMENT: sleeping for longer time approx 1min, so PR cluster is up after replication"
sleep 60



## login to PR cluster to get token
function vaultpr { VAULT_SKIP_VERIFY=true VAULT_ADDR=$VRD_ADDR:$PR_PORT vault $@ ;} ; alias v3='vaultpr'
PR_TOKEN=$(vaultpr login -method=userpass username=test password=test -format=json | jq -r '.auth.client_token')
function vaultpr { VAULT_TOKEN=$PR_TOKEN VAULT_SKIP_VERIFY=true VAULT_ADDR=$VRD_ADDR:$PR_PORT vault $@ ;} ; alias v3='vaultpr'



## enable DR2 replication
echo
echo "${green}COMMENT: enable replication DR2 primary"
echo

vaultpr write -f sys/replication/dr/primary/enable
sleep 5
PRIMARY_DR2_TOKEN=$(vaultpr write -format=json sys/replication/dr/primary/secondary-token id=vaultdr2rep | jq -r '.wrap_info .token')

echo
echo "${green}COMMENT: enable replication dr2 secondary"
echo
vaultdr2 write sys/replication/dr/secondary/enable token=${PRIMARY_DR2_TOKEN}
sleep 20
