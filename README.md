# Planning Maker
To deploy on Dokku (deprecated):
- The environment variables in app.json must be set.
- Run `# php app/console doctrine:fixtures:load` after first install

[![Deploy](https://www.herokucdn.com/deploy/button.svg)](https://heroku.com/deploy)

To deploy with Docker:
- Comment the 3 last lines in **Dockerfile** (lines only for Rancher CI/CD)
- Create the parameters.yml file from parameters.yml.docker.dist
- Build the docker-compose
- Fix permissions: `$ sudo chmod -R 777 prod/`
- Enter in php container: `$ docker-compose exec php bash`
- Update database: `# sf doctrine:schema:update --force`
- Load fixtures: `# sf doctrine:fixtures:load`
