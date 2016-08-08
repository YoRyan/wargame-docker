# wargame-docker
Dockerized Wargame: AirLand Battle and Wargame: Red Dragon dedicated servers.

To run any Wargame dedicated server, you have to [request a download link and
key from Eugen](http://forums.eugensystems.com/viewtopic.php?f=188&t=43873).

# build
The Dockerfiles have a mandatory `EUGEN_SERVER_DOWNLOAD_URL` argument, which you
get from Eugen when you request a dedicated server key.

    docker build --build-arg=EUGEN_SERVER_DOWNLOAD_URL=https://... -t yoryan/wargame3-server wargame3-server

# usage
Forward a port for the server (TCP and UDP) and set these mandatory environment
variables:

* `login`: your EugenNet login username
* `dedicated_key`: your dedicated server key from Eugen
* `ip`: public-facing IP address
* `port`: TCP/UDP port number of the server - this must match the one reachable
   at `ip`

Example:

    docker run -d \
        -e login=xxx \
        -e dedicated_key=hunter2 \
        -e ip=y.y.y.y \
        -e port=10001 \
        -p 10001:10001 -p 10001:10001/udp yoryan/wargame3-server

When passing additional command line arguments, add `wargame` in front:

    docker run ... -p 4242:4242 yoryan/wargame3-server wargame +rcon_port 4242 +rcon_password hunter2

You can override configuration files using host mounts.

    docker run ... -v /path/to/my/variables.ini:/srv/wargame/wargame3_server/variables.ini yoryan/wargame3-server

