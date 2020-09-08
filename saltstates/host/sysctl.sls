/etc/sysctl.d/noipv6.conf:
  file.managed:
    - user: root
    - group: root
    - mode: 0644
    - source: salt://salttemplates/host/sysctl_noipv6.j2
    - template: jinja

run_sysctl_load:
  cmd.run:
    - name: 'sysctl --system'
    - onchanges:
      - file: /etc/sysctl.d/noipv6.conf