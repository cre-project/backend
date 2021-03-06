# README

* Ruby version: `2.5.1` / `2.5.3`

* Rails version: `5.2.1`

* Database initialization: `bundle exec rake db:migrate`

* Run application in development: `rails server`

* Running the tests: `bundle exec rspec`

* Deployment: `git push heroku master`

## Environment Variables
* `DASHBOARD_URL`
* `SECRET_KEY_BASE`
* `PABBLY_API_KEY`
* `PABBLY_SECRET_KEY`
* `PDF_APP_API_KEY`
* `MASTER_KEY` (stored in `config/master.key`)

## Endpoints

### Authentication
* Authenticate: POST `/api/authenticate` (required: `email`, `password`)

### User
* Create: POST `api/users` (required: `email`)
* Update: PUT `api/users/:id`
* Pabbly redirect: GET `api/user/customer_portal_url` (required: `customer_id`)
* Activate user: POST `api/user/activate` (required: `token`, `password`)
* Subscription changed: POST `api/user/subscription_changed` (required: `expiry_date`, `id`, `customer_id`)

#### Company
Company is created with the user:
`{ user: { email: "donald.duck@gmail.com", first_name: "Donald", last_name: "Duck", company: { name: "Donald Inc." } } }`

### Package
* Index: GET `/api/packages` 
* Show: GET `/api/packages/:id`
* Full package: GET `/api/packages/:id/full_package`
* Rented units: GET `api/packages/:id/rented_units`
* Sold properties: GET `api/packages/:id/sold_properties`
* Create: POST `api/packages`
* Update: PUT `api/packages/:id`
* Destroy: DELETE `api/packages/:id`
* Update images: PUT `api/packages/:id/update_images` (required: `image_urls`)

### Property
* Index: GET `/api/properties` 
* Show: GET `/api/properties/:id`
* Create: POST `api/properties` (required: `price`)
* Update: PUT `api/properties/:id`
* Destroy: DELETE `api/properties/:id`


#### Address
Address is created with the property:
`{ property: { price: 200000, address: { street: "Pennsylvania Avenue", city: "Washington", state: "DC", zip: 19999 } } }`

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

#### Address
Address is created with the sold property:
`{ sold_property: { year_built: 2000, address: { street: "Pennsylvania Avenue", city: "Washington", state: "DC", zip: 19999 } } }`

### Rented Unit
* Index: GET `/api/rented_units` 
* Show: GET `/api/rented_units/:id`
* Create: POST `api/rented_units` (required: `bedrooms`, `current_rent`)
* Update: PUT `api/rented_units/:id`
* Destroy: DELETE `api/rented_units/:id`

#### Address
Address is created with the rented unit:
`{ rented_unit: { year_built: 2000, bedrooms: 2, bathrooms: 2, current_rent: 1000, address: { street: "Pennsylvania Avenue", city: "Washington", state: "DC", zip: 19999 } } }`

### Operating Statement
* Index: GET `/api/packages/:id/operating_statements` 
* Show: GET `/api/packages/:id/operating_statements/:id`
* Create: POST `api/packages/:id/operating_statements`
* Update: PUT `api/packages/:id/operating_statements/:id`
* Destroy: DELETE `api/packages/:id/operating_statements/:id`

### Operating Statement Field
* Index: GET `/api/package/:id/operating_statements/:id/operating_statement_fields` 
* Show: GET `/api/package/:id/operating_statements/:id/operating_statement_fields/:id`
* Create: POST `api/package/:id/operating_statements/:id/operating_statement_fields`
* Update: PUT `api/package/:id/operating_statements/:id/operating_statement_fields/:id`
* Destroy: DELETE `api/package/:id/operating_statements/:id/operating_statement_fields/:id`

### Package Sold Property
* Index: GET `/api/packages/:id/package_sold_properties` 
* Create: POST `api/packages/:id/package_sold_properties` (required: `sold_property_id`)
* Delete: DELETE `api/packages/:id/package_sold_properties/:id`

### Package Rented Unit
* Index: GET `/api/packages/:id/package_rented_units` 
* Create: POST `api/packages/:id/package_rented_units` (required: `rented_unit_id`)
* Delete: DELETE `api/packages/:id/package_rented_units/:id`
