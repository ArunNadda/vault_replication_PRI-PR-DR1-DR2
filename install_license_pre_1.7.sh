TOKEN1=$(cat PRI/root_token-vault_2)
TOKEN2=$(cat PR/root_token-vault_2)
TOKEN3=$(cat DR1/root_token-vault_2)
TOKEN4=$(cat DR2/root_token-vault_2)

LIC=<license here>

# PRI nodes
VAULT_TOKEN=$TOKEN1 VAULT_ADDR=http://127.0.0.1:8200 vault write sys/license "text=$LIC"
VAULT_TOKEN=$TOKEN1 VAULT_ADDR=http://127.0.0.1:8300 vault write sys/license "text=$LIC"
VAULT_TOKEN=$TOKEN1 VAULT_ADDR=http://127.0.0.1:8500 vault write sys/license "text=$LIC"
VAULT_TOKEN=$TOKEN1 VAULT_ADDR=http://127.0.0.1:8600 vault write sys/license "text=$LIC"
VAULT_TOKEN=$TOKEN1 VAULT_ADDR=http://127.0.0.1:8400 vault write sys/license "text=$LIC"

# PR nodes
VAULT_TOKEN=$TOKEN2 VAULT_ADDR=http://127.0.0.1:7200 vault write sys/license "text=$LIC"
VAULT_TOKEN=$TOKEN2 VAULT_ADDR=http://127.0.0.1:7300 vault write sys/license "text=$LIC"
VAULT_TOKEN=$TOKEN2 VAULT_ADDR=http://127.0.0.1:7500 vault write sys/license "text=$LIC"
VAULT_TOKEN=$TOKEN2 VAULT_ADDR=http://127.0.0.1:7600 vault write sys/license "text=$LIC"
VAULT_TOKEN=$TOKEN2 VAULT_ADDR=http://127.0.0.1:7400 vault write sys/license "text=$LIC"

# DR1 nodes
VAULT_TOKEN=$TOKEN3 VAULT_ADDR=http://127.0.0.1:9200 vault write sys/license "text=$LIC"
VAULT_TOKEN=$TOKEN3 VAULT_ADDR=http://127.0.0.1:9300 vault write sys/license "text=$LIC"
VAULT_TOKEN=$TOKEN3 VAULT_ADDR=http://127.0.0.1:9500 vault write sys/license "text=$LIC"
VAULT_TOKEN=$TOKEN3 VAULT_ADDR=http://127.0.0.1:9600 vault write sys/license "text=$LIC"
VAULT_TOKEN=$TOKEN3 VAULT_ADDR=http://127.0.0.1:9400 vault write sys/license "text=$LIC"

# DR2 nodes
VAULT_TOKEN=$TOKEN4 VAULT_ADDR=http://127.0.0.1:5200 vault write sys/license "text=$LIC"
VAULT_TOKEN=$TOKEN4 VAULT_ADDR=http://127.0.0.1:5300 vault write sys/license "text=$LIC"
VAULT_TOKEN=$TOKEN4 VAULT_ADDR=http://127.0.0.1:5500 vault write sys/license "text=$LIC"
VAULT_TOKEN=$TOKEN4 VAULT_ADDR=http://127.0.0.1:5600 vault write sys/license "text=$LIC"
VAULT_TOKEN=$TOKEN4 VAULT_ADDR=http://127.0.0.1:5400 vault write sys/license "text=$LIC"
