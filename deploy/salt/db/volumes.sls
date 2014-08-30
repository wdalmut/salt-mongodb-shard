/mongodb:
  mount.mounted:
    - device: /dev/xvdf1
    - fstype: ext4
    - mkmnt: True
    - opts:
      - defaults
