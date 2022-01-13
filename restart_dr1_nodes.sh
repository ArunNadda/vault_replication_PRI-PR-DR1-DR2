# restart DR1 secondare nodes
cd DR1
echo "stopping DR1 cluster"

./cluster_dr1.sh stop vault_2
./cluster_dr1.sh stop vault_3
./cluster_dr1.sh stop vault_4
./cluster_dr1.sh stop vault_5
./cluster_dr1.sh stop vault_6

echo "waiting 5 sec before starting DR1 cluster"
sleep 5

./cluster_dr1.sh start vault_2
./cluster_dr1.sh start vault_3
./cluster_dr1.sh start vault_4
./cluster_dr1.sh start vault_5
./cluster_dr1.sh start vault_6
cd ..
