# PRI nodes
echo "###########################################"
echo "Primary nodes:"
VAULT_ADDR=http://127.0.0.1:8200 vault status | grep Sealed
VAULT_ADDR=http://127.0.0.1:8300 vault status | grep Sealed
VAULT_ADDR=http://127.0.0.1:8400 vault status | grep Sealed
VAULT_ADDR=http://127.0.0.1:8500 vault status | grep Sealed
VAULT_ADDR=http://127.0.0.1:8600 vault status | grep Sealed

# PR nodes
echo "###########################################"
echo "PR nodes:"
VAULT_ADDR=http://127.0.0.1:7200 vault status | grep Sealed
VAULT_ADDR=http://127.0.0.1:7300 vault status | grep Sealed 
VAULT_ADDR=http://127.0.0.1:7400 vault status | grep Sealed
VAULT_ADDR=http://127.0.0.1:7500 vault status | grep Sealed
VAULT_ADDR=http://127.0.0.1:7600 vault status | grep Sealed

# DR2 nodes
echo "###########################################"
echo "DR2 nodes:"
VAULT_ADDR=http://127.0.0.1:5200 vault status | grep Sealed
VAULT_ADDR=http://127.0.0.1:5300 vault status | grep Sealed
VAULT_ADDR=http://127.0.0.1:5400 vault status | grep Sealed
VAULT_ADDR=http://127.0.0.1:5500 vault status | grep Sealed
VAULT_ADDR=http://127.0.0.1:5600 vault status | grep Sealed

# DR1 nodes
echo "###########################################"
echo "DR1 nodes:"
VAULT_ADDR=http://127.0.0.1:9200 vault status | grep Sealed
VAULT_ADDR=http://127.0.0.1:9300 vault status | grep Sealed
VAULT_ADDR=http://127.0.0.1:9400 vault status | grep Sealed
VAULT_ADDR=http://127.0.0.1:9500 vault status | grep Sealed
VAULT_ADDR=http://127.0.0.1:9600 vault status | grep Sealed
