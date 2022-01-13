# PR nodes
VAULT_ADDR=http://127.0.0.1:7400 vault operator unseal $(cat PRI/recovery_key-vault_2)
VAULT_ADDR=http://127.0.0.1:7300 vault operator unseal $(cat PRI/recovery_key-vault_2)
VAULT_ADDR=http://127.0.0.1:7500 vault operator unseal $(cat PRI/recovery_key-vault_2)
VAULT_ADDR=http://127.0.0.1:7600 vault operator unseal $(cat PRI/recovery_key-vault_2)
VAULT_ADDR=http://127.0.0.1:7200 vault operator unseal $(cat PRI/recovery_key-vault_2)

# DR1 nodes
VAULT_ADDR=http://127.0.0.1:5400 vault operator unseal $(cat PRI/recovery_key-vault_2)
VAULT_ADDR=http://127.0.0.1:5300 vault operator unseal $(cat PRI/recovery_key-vault_2)
VAULT_ADDR=http://127.0.0.1:5500 vault operator unseal $(cat PRI/recovery_key-vault_2)
VAULT_ADDR=http://127.0.0.1:5600 vault operator unseal $(cat PRI/recovery_key-vault_2)
VAULT_ADDR=http://127.0.0.1:5200 vault operator unseal $(cat PRI/recovery_key-vault_2)

# DR2 nodes
VAULT_ADDR=http://127.0.0.1:9400 vault operator unseal $(cat PRI/recovery_key-vault_2)
VAULT_ADDR=http://127.0.0.1:9300 vault operator unseal $(cat PRI/recovery_key-vault_2)
VAULT_ADDR=http://127.0.0.1:9500 vault operator unseal $(cat PRI/recovery_key-vault_2)
VAULT_ADDR=http://127.0.0.1:9600 vault operator unseal $(cat PRI/recovery_key-vault_2)
VAULT_ADDR=http://127.0.0.1:9200 vault operator unseal $(cat PRI/recovery_key-vault_2)
