# restart PRI secondare nodes
cd PRI
echo "stopping PRI cluster"
./cluster.sh stop vault_2
./cluster.sh stop vault_3
./cluster.sh stop vault_4
./cluster.sh stop vault_5
./cluster.sh stop vault_6

echo "waiting 5 sec before starting PRI cluster"
sleep 5

./cluster.sh start vault_2
./cluster.sh start vault_3
./cluster.sh start vault_4
./cluster.sh start vault_5
./cluster.sh start vault_6
cd ..
