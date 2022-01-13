# PR cluster
#cp /Users/anadda/Ent/vault_ent/vault_1.7.2 /Users/anadda/Ent/vault_ent/vault


# PRI cluster
cd PRI
./run_all.sh
cd ..

# DR1 cluster
cd DR1
./run_all.sh
cd ..

cd PR
./run_all.sh
cd ..

# DR2 cluster
cd DR2
./run_all.sh
cd ..
