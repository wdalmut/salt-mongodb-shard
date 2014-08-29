/etc/hosts:
    file.append:
        - template: jinja
        - source: salt://mongodb/hosts.conf
            
