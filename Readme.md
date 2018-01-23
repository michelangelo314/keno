# Keno

Keno is turtle power on docker! This is a nicely packaged turtlecoind service based on the minimal phusion/baseimage for ubuntu 16 (only 6mb!) and uses release builds instead of compiling (faster?? cowabunga!!!)

## Getting Started

Call and order your pizza for deliery (NO ANCHOVIES!!), then use git to checkout the project. `bin/start.sh` will start up the daemon container. `bin/stop.sh` will stop the running container. Cowabunga dude, you're on the network!!

### Prerequisites

Pepperoni, git, docker

### Installing

The turtlecoind service will be automatically installed from a release version on github (current version is v0.2.0). There are no futher installation steps.

The version installed is set by a docker environment variable and power users can set this using `TURTLECOIN_DIST_VERSION`.

## Deployment

The turtlecoin daemon exposes a port for RPC functions (this is why you are using it), `11898` by default. `bin/start.sh` binds this port from the container to the host as a part of its start up. To set this to another port change start.sh to reflect your deployment use case.

## Authors

master splinter, michelangelo314

## Code of conduct

How dare you? Really. 

## Copyright/License/Philosophy

No anchovies, dude

## Acknowledgments

* Rocksteady n bebop, the turtlefathers
* master splinter
* the tc gang

