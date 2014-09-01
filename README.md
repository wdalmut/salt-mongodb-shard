# SaltStack MongoDB Sharding configuration

Orchestrate MongoDB sharding with SaltStack.

## Create the whole stack using map

```
sudo salt-cloud -m /etc/salt/cloud.map.d/map-shard.conf -P
```

the map creates 4 shards (3 vm per shard, 2 replicas + 1 arbiter) than 3 config servers and 1 mongos instance.

## Prepare volumes

***PAY ATTENTION THAT ALL DATA INTO XVDF WILL BE DESTROYED!***

Prepare shards disks

```
sudo salt 'prod-aws-eu-mongo_rsX-*' cmd.run 'echo -e "o\nn\np\n1\n\n\nw" | fdisk /dev/xvdf'
sudo salt 'prod-aws-eu-mongo_rsX-*' extfs.mkfs /dev/xvdf1 fs_type=ext4
```

All mongos instances doesn't have any external volume.

## Configure your replica

Use the mongo client on each shard

```
rs.initiate()

conf = rs.conf()
conf.members[0].host = "prod-aws-eu-mongo_rs0_1:27017"

rs.reconfig(conf)

rs.add("prod-aws-eu-mongo_rs0-2:27017")
rs.addArb("prod-aws-eu-mongo_rs0-3:27017")
```

See your replica status


```
rs.status()
```

## Configure your shard

On one of your mongos

```
sh.addShard("rs0/ip1:27018,ip2:27018,ip3:27018")
```

```
sh.enableSharding("database")

sh.shardCollection("database.collection", {field: 1})
```

Here is the doc for sharding collection and the shard key:
http://docs.mongodb.org/manual/reference/method/sh.shardCollection/

