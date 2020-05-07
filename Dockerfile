FROM ubuntu:latest

COPY /root /

RUN apt-get update \
    && apt-get install -y --no-install-recommends \
        supervisor curl nano docker.io \
    && curl -L "https://github.com/docker/compose/releases/download/1.25.5/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose \
    && chmod +x /usr/local/bin/docker-compose \
    && apt-get autoclean -y \
    && apt-get autoremove -y 

ENTRYPOINT [ "/usr/bin/supervisord" ]
