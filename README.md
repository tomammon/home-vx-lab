# Introduction

# Branches

Branches in this repo are not meant to be merged to master - instead they are used as configuration snapshots to make it easy to switch between different lab scenarios using the same base topology. 

| branch          | description                                                         |
|-----------------|---------------------------------------------------------------------|
| master          | IP addresses configured and FRR enabled but not configured          |
| static-vxlan    | OSPF running, static VXLAN tunnels configured as described in docs/ |
| ibgp-vxlan-evpn | BGP with EVPN address family configured                             |
|                 |                                                                     |