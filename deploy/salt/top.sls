base:
    '*':
        - base
    'roles:mongodb':
        - match: grain
        - mongodb
        - mongodb.replica
    'roles:dev':
        - match: grain
        - mongodb.hosts
