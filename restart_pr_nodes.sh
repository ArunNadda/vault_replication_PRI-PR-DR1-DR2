# restart PR secondare nodes
cd PR
echo "stopping PR cluster"
./cluster_pr.sh stop vault_2
./cluster_pr.sh stop vault_3
./cluster_pr.sh stop vault_4
./cluster_pr.sh stop vault_5
./cluster_pr.sh stop vault_6

echo "waiting 5 sec before starting PR cluster"
sleep 5

./cluster_pr.sh start vault_2
./cluster_pr.sh start vault_3
./cluster_pr.sh start vault_4
./cluster_pr.sh start vault_5
./cluster_pr.sh start vault_6
cd ..
