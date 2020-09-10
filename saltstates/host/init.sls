# Host nodes master state file
{% set nodename = grains['host'] %}
{% set ibgp_role = grains['ibgp_role']}
include:
  - .grains
  - saltstates.common.motd
  - .interfaces
  - .sysctl
{% if ibgp_role == 'route_reflector' %}
  - .rr
{% endif %}