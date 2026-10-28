# syntax = docker/dockerfile:1.2

FROM verdaccio/verdaccio:6

USER root

ENV NODE_ENV=production

RUN npm install --global verdaccio-aws-s3-storage

COPY ./config.yaml /verdaccio/conf

RUN --mount=type=secret,id=htpasswd,dst=/etc/secrets/htpasswd cat /etc/secrets/htpasswd > /verdaccio/conf/htpasswd

USER verdaccio
