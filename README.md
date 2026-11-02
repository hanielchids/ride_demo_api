# Ride Demo API

A small, fictional ride-booking Rails API used as the starting point for a recorded engineering task: **adding a trip-rating feature**. Everything in here is invented demo data.

## Requirements
Ruby 3.2+ and Bundler. SQLite is used, so there is no database server to install.

## Setup
```sh
bin/setup          # bundle install, create + migrate + seed the database
bin/rails server   # http://localhost:3000
bin/rspec          # run the test suite (should be green before you start)
```

## Existing endpoints
- `GET /api/v1/drivers` and `GET /api/v1/drivers/:id`
- `GET /api/v1/trips` and `GET /api/v1/trips/:id` (optional `?status=completed`)

## The task
Read `docs/feature_brief.md`. The feature to build is the ratings endpoint and the driver average rating. Hints for where things go are left as comments in `config/routes.rb` and `app/serializers/driver_serializer.rb`.

## Handy commands during the task
```sh
bin/rails generate model Rating trip:references score:integer comment:text
bin/rails db:migrate
bin/rails console
bin/rspec spec/requests/api/v1/ratings_spec.rb
```

## Postman
Import `docs/ride_demo.postman_collection.json` to get the existing requests pre-configured against `http://localhost:3000`.
