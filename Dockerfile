FROM verdaccio/verdaccio:5

USER root

ENV NODE_ENV=production

RUN npm i && npm install verdaccio-aws-s3-storage

COPY ./config.yaml /verdaccio/conf
RUN echo $HTPASSWD > /verdaccio/conf/htpasswd

USER verdaccio
# Important step, $PORT is provided by heroku while verdaccio uses $VERDACCIO_PORT, we need to override it
CMD node -r ./.pnp.js $VERDACCIO_APPDIR/bin/verdaccio --config /verdaccio/conf/config.yaml --listen $VERDACCIO_PROTOCOL://0.0.0.0:$PORT
