base:
    '*':
        - base
    'roles:mongodb':
        - match: grain
        - db.volumes
        - mongodb
    'roles:mongos':
        - match: grain
        - mongodb.mongos
