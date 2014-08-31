{% set replica_set = salt['grains.get']('replica_set', none) %}
{% set config_svr = salt['grains.get']('config_svr', False) %}

mongodb:
    use_ppa: True
    version: 2.6.4
    package_name: mongodb-org
    mongo_directory: /mongodb
    {% if replica_set != none %}
    shard_srv: True
    replica_set:
        name: {{ replica_set }}
    {% endif %}
    {% if config_svr == True %}
    config_svr: True
    {% endif %}
    reconfigure_replica_set: False
    settings:
        {% if config_svr == True %}
        port: 27019
        {% elif replica_set != none %}
        port: 27018
        {% endif %}
        db_path: /mongodb/data
        log_path: /mongodb/log
        log_append: True
        rest: True
        bind_ip: 0.0.0.0

mongos:
  use_ppa: True
  version: 2.6.4
  package_name: mongodb-org-mongos
  settings:
    log_path: /mongodb/log
    log_file: /mongodb/log/mongos.log
    config_svrs: "ip-10-10-0-131:27019,ip-10-10-1-189:27019,ip-10-10-2-252:27019"
    port: 27017
