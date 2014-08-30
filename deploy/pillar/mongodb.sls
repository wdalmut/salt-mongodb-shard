{% set replica_set = salt['grains.get']('replica_set', none) %}
{% set config_svr = salt['grains.get']('config_svr', False) %}

mongodb:
    use_ppa: True
    version: 2.6.4
    package_name: mongodb-org
    mongo_directory: /mongodb
    {% if replica_set != none %}
    replica_set:
        name: {{ replica_set }}
    {% endif %}
    {% if config_svr == True %}
    config_svr: True
    {% endif %}
    reconfigure_replica_set: False
    settings:
        db_path: /mongodb/data
        log_path: /mongodb/log
        log_append: True
        rest: True
        bind_ip: 0.0.0.0
