# static-site-docker

A static site containerized with nginx, plus a Docker Compose stack that runs it alongside a MySQL service.

First project of a hands-on Cloud/DevOps roadmap — the starting point for containerization before moving on to CI/CD and infrastructure as code.

## What's here

| File | Purpose |
| ---- | ------- |
| `Dockerfile` | Builds an `nginx:alpine` image with the site baked in |
| `docker-compose.yml` | Runs the site and a MySQL service on a shared network |
| `sitio/` | The static site content |

## Build and run

```bash
docker build -t mi-sitio:v1 .
docker run -d -p 8081:80 mi-sitio:v1
```

The site is served at `http://localhost:8081`.

## Running the stack

The Compose file expects a `MYSQL_ROOT_PASSWORD` variable. Create a local `.env` file (it is gitignored):

Then:

```bash
docker compose up -d
docker compose down
```

`down` removes the containers and network but leaves the named volume intact, so database data survives.

## Notes

Credentials are kept out of the repository and read from the environment — the same pattern later replaced by encrypted secrets in a CI pipeline.
