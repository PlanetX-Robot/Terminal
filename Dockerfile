FROM ubuntu:latest

COPY /root /

RUN apt-get update \
    && apt-get install -y --no-install-recommends \
        supervisor curl nano docker.io docker-compose \
    && apt-get autoclean -y \
    && apt-get autoremove -y 

ENTRYPOINT [ "/usr/bin/supervisord" ]
