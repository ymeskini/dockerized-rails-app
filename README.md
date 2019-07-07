To scaffold the app run `docker-compose run --user $(id -u):$(id -g) app rails new . --force --database=postgresql --skip-bundle`

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


test:
  <<: *default
  database: myapp_test
```

If the Gemfile is change re run `docker-compose build`

To run the app simply run `docker-compose up`

To run rails command in dockerized app `docker-compose exec app rails ...`
