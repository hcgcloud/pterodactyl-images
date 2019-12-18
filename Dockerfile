FROM        ubuntu:latest

MAINTAINER  HCGCLOUD, <service@hcgcloud.com>

RUN         apt update \
            && apt upgrade -y \
            && apt install -y libstdc++6 lib32stdc++6 curl iproute2 openssl \
            && useradd -d /home/container -m container

USER        container
ENV         HOME=/home/container
WORKDIR     /home/container

COPY        ./entrypoint.sh /entrypoint.sh
CMD         ["/bin/bash", "/entrypoint.sh"]