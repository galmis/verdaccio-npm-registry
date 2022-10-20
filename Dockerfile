# syntax = docker/dockerfile:1.2

FROM verdaccio/verdaccio:5

USER root

ENV NODE_ENV=production

RUN --mount=type=secret,id=htpasswd,dst=/etc/secrets/htpasswd cat /verdaccio/conf/htpasswd && yarn && yarn add verdaccio-aws-s3-storage

COPY ./config.yaml /verdaccio/conf

# ARG leaves a trace in docker image, so not recommended for secrets
# ARG HTPASSWD
# RUN printf "%s" "$HTPASSWD" > /verdaccio/conf/htpasswd

USER verdaccio

# Important step, $PORT is provided by hosting providers (e.g. heroku, render.com) while verdaccio uses $VERDACCIO_PORT, we need to override it
CMD node -r ./.pnp.js $VERDACCIO_APPDIR/bin/verdaccio --config /verdaccio/conf/config.yaml --listen $VERDACCIO_PROTOCOL://0.0.0.0:$PORT
