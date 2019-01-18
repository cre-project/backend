# README

* Ruby version: `2.5.1` / `2.5.3`

* Rails version: `5.2.1`

* Database initialization: `bundle exec rake db:migrate`

* Run application in development: `rails server`

* Running the tests: `bundle exec rspec`

* Deployment: `git push heroku master`

## Environment Variables
* `SECRET_KEY_BASE`
* `PABBLY_API_KEY`
* `PABBLY_SECRET_KEY`
* `BACKEND_API_KEY`

## Endpoints

### Authentication
* Authenticate: POST `/api/authenticate` (required: `email`, `password`)

### User
* Create: POST `api/users` (required: `email`)
* Update: PUT `api/users/:id`
* Pabbly redirect: GET `user/customer_portal_url` (required: `customer_id)

### Package
* Index: GET `/api/packages` 
* Show: GET `/api/packages/:id`
* Full package: GET `/api/packages/full_package/:id`
* Create: POST `api/packages`
* Update: PUT `api/packages/:id`
* Destroy: DELETE `api/packages/:id`

### Property
* Index: GET `/api/properties` 
* Show: GET `/api/properties/:id`
* Create: POST `api/properties` (required: `price`)
* Update: PUT `api/properties/:id`
* Destroy: DELETE `api/properties/:id`

### Property Unit
* Index: GET `/api/properties/:id/property_units` 
* Create: POST `api/properties/:id/property_units` (required: `bedrooms`, `bathrooms`, `current_rent`)
* Destroy: DELETE `api/properties/:id/property_units/:id`

### Sold Property
* Index: GET `/api/sold_properties` 
* Show: GET `/api/sold_properties/:id`
* Create: POST `api/sold_properties`
* Update: PUT `api/sold_properties/:id`
* Destroy: DELETE `api/sold_properties/:id`

### Rented Unit
* Index: GET `/api/rented_units` 
* Show: GET `/api/rented_units/:id`
* Create: POST `api/rented_units` (required: `bedrooms`, `current_rent`)
* Update: PUT `api/rented_units/:id`
* Destroy: DELETE `api/rented_units/:id`

### Operating Statement
* Index: GET `/api/operating_statements` 
* Show: GET `/api/operating_statements/:id`
* Create: POST `api/operating_statements`
* Update: PUT `api/operating_statements/:id`
* Destroy: DELETE `api/operating_statements/:id`

### Operating Statement Field
* Index: GET `/api/operating_statements/:id/operating_statement_fields` 
* Show: GET `/api/operating_statements/:id/operating_statement_fields/:id`
* Create: POST `api/operating_statements/:id/operating_statement_fields`
* Update: PUT `api/operating_statements/:id/operating_statement_fields/:id`
* Destroy: DELETE `api/operating_statements/:id/operating_statement_fields/:id`

### To be added when completed
* Address for some models
* Package sold property
* Package rented unit


