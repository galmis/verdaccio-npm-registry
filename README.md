# Verdaccio deployment

Based on inspiration of [https://github.com/autotelic/verdaccio-heroku-docker](https://github.com/autotelic/verdaccio-heroku-docker) and [God Q Superman blog](https://medium.com/starbugs/%E7%94%A8-verdaccio-%E5%BF%AB%E9%80%9F%E5%BB%BA%E7%AB%8B%E5%B0%88%E5%B1%AC%E7%9A%84-private-npm-proxy-%E4%B8%A6%E9%83%A8%E7%BD%B2%E5%88%B0-heroku-%E4%B8%8A-7866d2a0494c).

## Test

To test a docker image locally, run the following from the cloned repo's folder:

```bash
DOCKER_BUILDKIT=1 docker build --secret id=htpasswd,src=/etc/secrets/htpasswd . -t=verdaccio
```

## Deploy
The project is configured to be deployed to render.com with max_users set to -1 (registration disabled). Don't forget to create a htpasswd secret file in render.

## Demo

[Demo website](https://verdaccio-test1.herokuapp.com/).
