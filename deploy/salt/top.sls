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
