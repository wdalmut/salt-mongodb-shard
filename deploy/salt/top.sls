base:
    '*':
        - base
    'roles:mongodb':
        - match: grain
        - mongodb
        - mongodb.replica
        - mongodb.hosts
