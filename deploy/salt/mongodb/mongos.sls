{% set db_path        = salt['pillar.get']('mongodb:db_path', "/data/db") %}

mongodb-org-mongos:
  pkg.installed

/etc/init/mongod.conf:
  file.managed:
    - source: salt://mongodb/init/mongos.conf
    - watch_in:
      - service: mongod

/etc/mongod.conf:
  file.managed:
    - source: salt://mongodb/mongos.conf
    - template: jinja
    - watch_in:
      - service: mongod

