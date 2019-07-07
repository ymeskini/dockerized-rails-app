To scaffold the app run `docker-compose run --user $(id -u):$(id -g) app rails new . --force --database=postgresql --skip-bundle`

If the Gemfile is change re run `docker-compose up --build`
