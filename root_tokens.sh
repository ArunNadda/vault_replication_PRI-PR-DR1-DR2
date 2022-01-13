# root tokens of all clusters

TOKEN1=$(cat PRI/root_token-vault_2)
TOKEN2=$(cat PR/root_token-vault_2)
TOKEN3=$(cat DR1/root_token-vault_2)
TOKEN4=$(cat DR2/root_token-vault_2)

echo "Initial root tokens of all clusters:"
echo "----------------------------------"

echo "Root token of PRI cluster, http://127.0.0.1:8200: $TOKEN1"
echo "Root token of PR cluster, http://127.0.0.1:7200: $TOKEN2"
echo "Root token of DR1 cluster, http://127.0.0.1:9200: $TOKEN3"
echo "Root token of DR2 cluster, http://127.0.0.1:5200: $TOKEN4"
