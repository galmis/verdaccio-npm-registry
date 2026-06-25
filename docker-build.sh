#!/bin/bash

# verbose - prints output, e.g. echo
docker build . -t npm-registry-local --secret id=htpasswd,src=htpasswd --progress=plain --no-cache

# cached
# docker build . -t npm-registry-local --secret id=htpasswd,src=htpasswd