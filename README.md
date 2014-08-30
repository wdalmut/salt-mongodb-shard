# SaltStack MongoDB Sharding configuration

Orchestrate MongoDB sharding with SaltStack.

## Prepare volumes

```
sudo salt '*' cmd.run 'echo -e "o\nn\np\n1\n\n\nw" | fdisk /dev/xvdf'
sudo salt '*' extfs.mkfs /dev/xvdf1 fs_type=ext4
```

## Create replicas 

```
sudo salt-cloud -m /etc/salt/cloud.map.d/map-shard.conf -P
```

## Configure your replica

Use the mongo client

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

## Update mines

```
sudo salt '*' mine.update
```


