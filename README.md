## A Swarm cluster in seconds

  * Get [OpenStack creds](machines/creds/README.md)
  * Create [SSH keys](machines/ssh/README.md)
  * Size your [cluster](https://github.com/thbkrkr/swarm-up/blob/master/machines/bim/swarm.tf)

Run [`m swarm-up`](https://github.com/thbkrkr/swarm-cluster/blob/master/Makefile#L6) from [dops](https://github.com/thbkrkr/dops).

    > make go
    [ops] Start bim-ops local...

    /ops master  [cluster:bim]  root@io-ops [indocker]
    > m swarm-up
