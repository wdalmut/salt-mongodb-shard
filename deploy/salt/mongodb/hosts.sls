{% set is_dev = salt['grains.get']('roles:dev', none) %}

/etc/hosts:
    file.append:
        - template: jinja
        {% if is_dev != none %}
        - source: salt://mongodb/hosts/dev.conf
        {% else %}
        - source: salt://mongodb/hosts/prod.conf
        {% endif %}
     
