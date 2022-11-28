# Roodjongeren.nl

## Overview

The application consists of:

- A Strapi backend
- A NextJS frontend
- A Postgres database
- An Nginx reverse proxy

### Prerequisites

- Yarn
- Docker Compose

## Developing

### Starting a development stack

First, start Postgres and Nginx using Docker Compose. Go to the root directory and run:

```bash
docker-compose -f docker/roodjongeren_dev/docker-compose.yml up -d
```

Then start the Strapi backend. Go to `/backend` and run:

```bash
yarn install # Not needed if you have already installed the latest dependencies
yarn build # Not needed if you have already done this and made no major changes
yarn dev
```

To start the NextJS frontend, open another terminal session and go to `/frontend`. In there, run:

```bash
yarn install # Not needed if you have already installed the latest dependencies
yarn dev
```

Nginx will forward requests from, `localhost:80` to the NextJS and forward requests from `localhost:80/backend` to
Strapi.

To view the website, open `localhost`. To go to the Strapi admin console, open `localhost/backend/admin`.

## Deploying

### Starting a production stack

Deployment is the easiest through Docker. First test that the production is working locally. The .env-file you can find
under `/docker/roodjongeren_prod/` should allow for you to run the complete stack locally. Stop your development stack
and run the following command from the root directory to start the production stack:

```bash
docker-compose -f docker/roodjongeren_prod/docker-compose.yml up -d --build
```

This will boot up the entire stack in Docker containers, while only exposing port 80 of Nginx. Navigate to `localhost`
and `localhost/backend/admin` and ensure everything is working as expected.

When building images for production, it's recommended to add an additional .env-file called `.env.prod`. Do not add this
file to version control. Reference the .env-file with the `--env-file` flag when building the images for production.

You can use mailcatcher to see the emails the strapi application sends. Mailcatcher will be available on http://localhost:1080
after starting the docker-compose.yml.

### Production server notes

On the production server, the nginx docker is instead run as a regular nginx ubuntu service. The nginx on the host proxy
passes to the frontend and backend docker services. The docker compose file that's used on the server is located at
`/home/ubuntu/roodjongeren/docker-compose.yml`. Restart the docker containers with `docker compose restart`.

The nginx configuration is located at `/etc/nginx/sites-enabled/roodjongeren.nl.conf`. Whenever the nginx config is changed,
reload it using `sudo systemctl reload nginx`.

### Deploying on production

Make sure your latest changes have been pushed. `ssh` into the production instance. `cd` to `~/roodjongeren`.
This is where the docker compose file is, as well as the .env file. `cd roodjongeren` to open the cloned repository.
Pull the latest changes from GitHub via `sudo git pull`.

Afterwards `cd ..` back into the folder with your docker compose file and
run `sudo docker compose build [service] [--no-cache]` to create new docker images.
Deploy them with `sudo docker compose up`.

### Backing Up & Restoring Database

You can back up a database from the host machine using the following command:

```bash
docker exec -t rood_postgres pg_dump -c -U rood rood > dump_rood.sql
```

To restore the backup of the database into a running Postgres container, use the following:

```bash
cat dump_rood.sql | docker exec -i rood_postgres psql -U rood -d rood
```

To back up images and files uploaded to Strapi, you can run `docker cp` in the instance:

```bash
sudo docker cp rood_strapi:/usr/src/app/public/uploads/ uploads_backup/
```

### Configuring SSL

The Nginx rules as specified in `nginx_ssl.conf` expect a certbot setup created using a webroot. You should volume mount
this file on a deployed environment, rather than `nginx.conf`.

See https://ssl-config.mozilla.org/#server=nginx&version=1.21.6&config=intermediate&openssl=1.1.1k&guideline=5.6 for
details.

### Adding Strapi Enterprise license

For local development, add a `license.txt` file to `backend/`. Place the Strapi license key in this file.

For production instances, assign the license to the `STRAPI_LICENSE` key in your deployed .env file.

### Setting up Umami analytics

The docker compose stack automatically builds and deploys [Umami](https://umami.is/), together with its own Postgres
instance.

Umami can be accessed from `/umami`. For first time setups please change the default password for the admin account.
By default, the login credentials are "admin" and "umami".

After logging in, add the website you want to track. The script it gives you should be placed in the head element of the
frontend.

Add appropriate non-admin user accounts for everyone you want to give access to view the analytics.

## Planned improvements

- Add a WYSIWYG editor
- Adopt NextJS' "standalone" feature once it's no longer experimental
