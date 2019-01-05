Rails.application.routes.draw do
  get "/healthcheck", to: proc { [200, {}, ["OK"]] }
  namespace 'api' do
    resources :operating_statement_fields
    resources :operating_statements
    resources :users do
      resources :companies
    end
    resources :packages
    resources :sold_properties
    resources :rented_units
    resources :property_units
    resources :properties
    resources :addresses
    resources :package_sold_properties
    resources :package_rented_units
    post 'authenticate', to: '/api/authentication#authenticate'
    post 'passwords/request_reset', to: 'passwords#request_reset'
    post 'passwords/reset', to: 'passwords#reset'
  end
end
