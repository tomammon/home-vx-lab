{% set nodename = grains['hostname'] %}

/etc/network/interfaces:
  file.managed:
    - user: root
    - group: root
    - mode: 0644
    - source: salt://salttemplates/network/interfaces/{{ nodename }}.txt

run_ifreload:
  cmd.run:
    - name: 'ifreload -a'
    - onchanges:
      - file: /etc/network/interfaces
