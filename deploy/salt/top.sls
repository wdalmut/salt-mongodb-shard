base:
    '*':
        - base
    'roles:mongodb':
        - match: grain
        - db.volumes
        - mongodb
    'roles:mongodb-repl':
        - match: grain
        - mongodb.replica
        - mongodb.hosts
    'roles:mongodb-cfg':
        - match: grain
        - mongodb.configsvr
