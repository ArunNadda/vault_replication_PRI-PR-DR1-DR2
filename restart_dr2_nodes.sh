# restart DR2 secondare nodes
cd PR
echo "stopping DR2 cluster"
./cluster_dr2.sh stop vault_2
./cluster_dr2.sh stop vault_3
./cluster_dr2.sh stop vault_4
./cluster_dr2.sh stop vault_5
./cluster_dr2.sh stop vault_6

echo "waiting 5 sec before starting DR2 cluster"
sleep 5

./cluster_dr2.sh start vault_2
./cluster_dr2.sh start vault_3
./cluster_dr2.sh start vault_4
./cluster_dr2.sh start vault_5
./cluster_dr2.sh start vault_6
cd ..
