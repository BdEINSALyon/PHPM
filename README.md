# Planning Maker
To deploy on Dokku (deprecated):
- The environment variables in app.json must be set.
- Run `# php app/console doctrine:fixtures:load` after first install.

[![Deploy](https://www.herokucdn.com/deploy/button.svg)](https://heroku.com/deploy)

To deploy with Docker:
- Comment the 2 last lines in **Dockerfile** (lines only for Rancher CI/CD).
- Create the **parameters.yml** file in **prod** directory from **parameters.yml.docker.dist** file in **app/config** directory.
- Build the docker-compose.
- Fix permissions: `$ sudo chmod -R 777 prod/`
- Enter in php container: `$ docker-compose exec php bash`
- Update database: `# sf doctrine:schema:update --force`
- Load fixtures: `# sf doctrine:fixtures:load` (first deploy only).

To first deploy with Rancher (GitLab CI/CD):
- Run a build pipeline for PHPM and PHPM-nginx.
- Configure stack with **docker-compose.rancher**.
- Create the **parameters.yml** file from **parameters.yml.docker.dist** file in **app/config** directory.
- Load fixtures: `# sf doctrine:fixtures:load`

Known issues:
- `502 Bad Gateway` => Reload nginx: `# nginx -s reload`
