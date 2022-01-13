### README.md
- this repo is for vault ent and to setup replication, tested on mac. vault ent binary shall be present in $PATH env.
- It will setup 4 different 5 node clusters
- If vault is 1.7.x or higher, copy `license.hcl` with license text in this file to each of PRI/, DR1/, DR2/, PR/ directories before exeduting `./cluster_setup.sh`.
- setup clusters: `./clusters_setup.sh`
- clusters details

1. PRI cluster

```
# 1 node inmem transit cluster
http://127.0.0.1:8100
```

```
# 5 node Raft cluster (auto unseal using above transit cluster)
http://127.0.0.1:8200
http://127.0.0.1:8300
http://127.0.0.1:8400
http://127.0.0.1:8500
http://127.0.0.1:8600
```


2. DR1 cluster

```
# 1 node inmem transit cluster
http://127.0.0.1:9100
```

```
# 5 node Raft cluster (auto unseal using above transit cluster)
http://127.0.0.1:9200
http://127.0.0.1:9300
http://127.0.0.1:9400
http://127.0.0.1:9500
http://127.0.0.1:9600
```

3. PR cluster

```
# 1 node inmem transit cluster
http://127.0.0.1:7100
```

```
# 5 node Raft cluster (auto unseal using above transit cluster)
http://127.0.0.1:7200
http://127.0.0.1:7300
http://127.0.0.1:7400
http://127.0.0.1:7500
http://127.0.0.1:7600
```

4. DR2 cluster

```
# 1 node inmem transit cluster
http://127.0.0.1:5100
```

```
# 5 node Raft cluster (auto unseal using above transit cluster)
http://127.0.0.1:5200
http://127.0.0.1:5300
http://127.0.0.1:5400
http://127.0.0.1:5500
http://127.0.0.1:5600
```
- get root tokens on all clusters: `./root_tokens.sh` # before replication setup
- get seal status of all nodes: `./get_status_all_nodes.sh`
- If vault 1.7.x or lower - to install license run `install_license_pre_1.7.sh`. add license text under LIC in this script.
- setup replications (PRI -> DR1, PR -> DR2, PRI -> PR): `./replication_setup.sh`
- root token of DR1,PR and DR2 will not work once replication is setup.

- unseal nodes after replication setup (of PR,DR1 and DR2 clusters)

```
./unseal_nodes.sh
```
- restart cluster nodes

```
# PRI cluster
./restart_pri_nodes.sh

# PR cluster
./restart_pr_nodes.sh

# DR1 cluster
./restart_dr1_nodes.sh

# DR2 cluster
./restart_dr2_nodes.sh
```
- use userpass to login to PR after replication is enabled (user:pwd = test:test) with policy `admin_pol.hcl`.






### cluster config files and logs etc

#### PRI cluster
- cluster is created using `cluster.sh` script under PRI directory. It created config file , raft directory for each node under same directory. Vault node logs are also stored in same directory as `vault_{1..5}.log`. Root token, recovery/unseal keys are also stored in same directory.
- directory/file structure is same for other clusters too.



### clean clusters setup

- clean clusters: `./clean_clusters.sh`
