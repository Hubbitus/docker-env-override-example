#!/usr/bin/env bash

# https://github.com/docker/compose/issues/3435#issuecomment-272681399
set -a && . .env.dev && docker-compose up