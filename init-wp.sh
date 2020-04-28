#!/bin/bash

# mute CMD from official wordpress image
sed -i -e 's/^exec "$@"/#exec "$@"/g' /usr/local/bin/docker-entrypoint.sh

# execute bash script from official wordpress image
docker-entrypoint.sh apache2-foreground

# execute CMD
exec "$@"
exec apache2-foreground
