# Docker

## Rodar o projeto

```
$ docker-compose up -d
```

## Ver o status

```
$ docker-compose ps

         Name                       Command               State     Ports
---------------------------------------------------------------------------
docker_blog_database_1   docker-entrypoint.sh postgres    Up       5432/tcp
docker_blog_redis_1      docker-entrypoint.sh redis ...   Up       6379/tcp
docker_blog_web_1        bin/rails s -b 0.0.0.0           Exit 1
```

## Ver o log

```
$ docker-compose logs -f web
```

## Fazer o build

```
$ docker-compose build web
```

# README

This is a sample Rails 6 application from Docker for Rails Developers (PragProg).
It was generated using Docker without Ruby installed on the local machine.

Things you may want to cover:

- Ruby version

- System dependencies

- Configuration

- Database creation

- Database initialization

- How to run the test suite

- Services (job queues, cache servers, search engines, etc.)

- Deployment instructions

- ...
