# my_project

## Running the Application Locally

1. Prepare database: 
```psql

CREATE DATABASE userportal;
CREATE USER dart_app WITH PASSWORD 'dart';
GRANT ALL ON DATABASE userportal TO dart_app;
```

1. Run `aqueduct db generate` at first time and put stubs into seed() methods 

OR

aqueduct db upgrade --connect postgres://dart_app:dart@localhost:5432/userportal

1. Run `aqueduct serve` from this directory to run the application. For running within an IDE, run `bin/main.dart`. By default, a configuration file named `config.yaml` will be used.

1. To generate a SwaggerUI client, run `aqueduct document client`.

## Running Application Tests

To run all tests for this application, run the following in this directory:

```
pub run test
```

The default configuration file used when testing is `config.src.yaml`. This file should be checked into version control. It also the template for configuration files used in deployment.

## URLS:
GET:

- http://localhost:8888/users  get all users
- http://localhost:8888/users/11 get id=11 user
- http://localhost:8888/users?name=Mr get by start name

POST:
- http://localhost:8888/users  add new users with:

header:
 ```
 [{"key":"Content-Type","value":"application/json","description":""}]
```
body:
```
{
  "name": "Test"
}
```

## Deploying an Application

See the documentation for [Deployment](https://aqueduct.io/docs/deploy/).