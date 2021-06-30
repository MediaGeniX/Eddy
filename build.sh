#!/bin/bash
docker-compose build
EDITOR="vim" RAILS_ENV=production rails credentials:edit
docker-compose run web rake db:create
docker-compose run web rake db:seed
docker-compose run web rake assets:precompile
