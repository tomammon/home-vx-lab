# Host nodes master state file
{% set nodename = grains['host'] %}

include:
  - .grains
  - saltstates.common.motd
  - .interfaces
  - .sysctl
{% if nodename == 'h10' or nodename == 'h12' %}
  - .routing
{% endif %}