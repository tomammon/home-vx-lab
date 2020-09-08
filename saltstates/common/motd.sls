/etc/motd:
  file.managed:
    - user: root
    - group: root
    - mode: 0644
    - source: salt://salttemplates/common/motd.j2
    - template: jinja