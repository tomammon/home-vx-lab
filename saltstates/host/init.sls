# Host nodes master state file
{% set nodename = grains['host'] %}

include:
  - .grains
  - saltstates.common.motd
  - .interfaces
  - .sysctl
{% if grains['ibgp_role'] is defined %}
  - .{{ ibgp_role }}
{% endif %}