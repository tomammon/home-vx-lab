/etc/frr/frr.conf:
  file.managed:
    - user: root
    - group: root
    - mode: 0644
    - source: salt://salttemplates/network/frr.conf.j2
    - template: jinja

/etc/frr/daemons:
  file.managed:
    - user: root
    - group: root
    - mode: 0644
    - source: salt://salttemplates/network/daemons.j2
    - template: jinja

frr_reload:
  service.running:
    - name: frr
    - enable: True
    - reload: True
    - watch:
      - file: /etc/frr/frr.conf

frr_restart:
  service.running:
    - name: frr
    - enable: True
    - watch:
      - file: /etc/frr/daemons