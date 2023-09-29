# Meals/Calories Demo Project

## Backend - API (Rails)

The backend folder contains the Ruby on Rails code for the API. It uses MySQL for database and Elastic Search.


### For Elastic Search:

`deb:`
* curl -L -O https://artifacts.elastic.co/downloads/elasticsearch/elasticsearch-7.9.3-amd64.deb
* sudo dpkg -i elasticsearch-7.9.3-amd64.deb
* sudo /etc/init.d/elasticsearch start

`rpm:`
* curl -L -O https://artifacts.elastic.co/downloads/elasticsearch/elasticsearch-7.9.3-x86_64.rpm
* sudo rpm -i elasticsearch-7.9.3-x86_64.rpm
* sudo service elasticsearch start

`mac:`
* curl -L -O https://artifacts.elastic.co/downloads/elasticsearch/elasticsearch-7.9.3-darwin-x86_64.tar.gz
* tar -xzvf elasticsearch-7.9.3-darwin-x86_64.tar.gz
* cd elasticsearch-7.9.3
* ./bin/elasticsearch

`brew:`
* brew install Elasticsearch
* brew services start Elasticsearch
* OR
* brew tap elastic/tap
* brew install elastic/tap/elasticsearch-full
* elasticsearch

`linux:`
* curl -L -O https://artifacts.elastic.co/downloads/elasticsearch/elasticsearch-7.9.3-linux-x86_64.tar.gz
* tar -xzvf elasticsearch-7.9.3-linux-x86_64.tar.gz
* cd elasticsearch-7.9.3
* ./bin/elasticsearch

### For Project Setup:
`cd backend` and you can:

* `make setup` to setup the environment, install dependencies, create and seed the database.
  * Uses `ruby 2.6.0`, `gem 3.0.1`, `rails 5.2.2`, and MySQL.
* `make server` to run the API server on port 3001.
  * Try it out: <http://localhost:3001>

## Frontend - UI (React)

The frontend folder contains the React code with end-end tests.

`cd frontend` and you can:

* `make setup` to setup the environment, and install dependencies.
  * Uses `node v11.7.0` and `npm 6.6.0`.
* `make server` to run the front-end react server on port 3000.
  * Try it out: <http://localhost:3000>
