# Bilinho - Billing Managment API

## Development Environment setup

To setup Bilinho to local development you need to install:

  * Docker
  * Docker-compose

## Setup and running

* Build the image:
```shell
docker-compose build bilinho
```
* Run the container:
```shell
docker-compose up -d bilinho
```
* On First Run, connect to the container and run migrations and seed:
```shell
docker-compose exec bilinho sh
bundle exec rails db:create
bundle exec rails db:migrate
bundle exec rake db:seed
```
* The server will start running when you run the container, there's no need to start the server manually

* The server should be avaiable on localhost:3000

## Running tests
Simply run inside the container:
```shell
bundle exec rspec
```
