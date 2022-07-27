# Verdaccio deployment in Heroku

Based on inspiration of [https://github.com/autotelic/verdaccio-heroku-docker](https://github.com/autotelic/verdaccio-heroku-docker) and [God Q Superman blog](https://medium.com/starbugs/%E7%94%A8-verdaccio-%E5%BF%AB%E9%80%9F%E5%BB%BA%E7%AB%8B%E5%B0%88%E5%B1%AC%E7%9A%84-private-npm-proxy-%E4%B8%A6%E9%83%A8%E7%BD%B2%E5%88%B0-heroku-%E4%B8%8A-7866d2a0494c).

## Deploy

[![Deploy](https://www.herokucdn.com/deploy/button.svg)](https://heroku.com/deploy)

To build a docker image and release it, run the following:

```bash
heroku container:login
```

```bash
source env.sh
```

> NOTE: your env.sh should contain HTPASSWD=YOUR_HTPASSWD environment variable. To generate one use https://hostingcanada.org/htpasswd-generator

```bash
heroku container:push web --arg HTPASSWD="$HTPASSWD" -a <YOUR HEROKU APP NAME>
heroku container:release web -a <YOUR HEROKU APP NAME>
```

## Demo

[Demo website](https://verdaccio-test1.herokuapp.com/).
