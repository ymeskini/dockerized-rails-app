To scaffold the app run `docker-compose run --user $(id -u):$(id -g) app rails new . --force --database=postgresql --skip-bundle`

To run any command in the container `docker-compose exec --user $(id -u):$(id -g) app /bin/bash`

Add the following lines in `config/database.yml`

```
default: &default
  adapter: postgresql
  encoding: unicode
  host: db
  username: postgres
  password:
  pool: 5

development:
  <<: *default
  database: myapp_development
```

If the Gemfile is changed re run `docker-compose build`

To run the app simply run `docker-compose up`

To run rails command in dockerized app `docker-compose exec app rails ...`
