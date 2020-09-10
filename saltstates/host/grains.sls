{% set nodename = grains['host'] %}

/etc/salt/grains:
  file.managed:
    - user: root
    - group: root
    - mode: 0644
    - source: salt://salttemplates/host/grains/{{ nodename }}.grains

run_refreshgrains:
  cmd.run:
    - name: 'salt-call saltutil.refresh_grains'
    - onchanges:
      - file: /etc/salt/grains