base:
    '*':
      - base
    'roles:mongodb':
        - match: grain
        - mongodb
    'roles:mongos':
        - match: grain
        - mongodb
