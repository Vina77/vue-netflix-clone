#!/bin/bash

# Substitua as variáveis no arquivo .env.local.template
envsubst < .env.local.template > .env.local

# Execute o comando original do Docker (por exemplo, `npm run serve` para um projeto Vue.js)
exec "$@"