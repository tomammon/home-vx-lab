{{ saltenv }}:
  'node_type:network':
    - match: grain
    - saltstates.network
  'node_type:host':
    - match: grain
    - saltstates.host
