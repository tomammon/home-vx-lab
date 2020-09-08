{% set nodename = grains['host'] %}

/etc/network/interfaces:
  file.managed:
    - user: root
    - group: root
    - mode: 0644
    - source: salt://salttemplates/host/interfaces/{{ nodename }}.j2
    - template: jinja

run_ifreload:
  cmd.run:
    - name: 'ifreload -a'
    - onchanges:
      - file: /etc/network/interfaces
