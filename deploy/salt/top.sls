base:
    '*':
        - base
    'roles:mongodb':
        - match: grain
        - mongodb
    'roles:mongodb-repl':
        - match: grain
        - mongodb.replica
        - mongodb.hosts
