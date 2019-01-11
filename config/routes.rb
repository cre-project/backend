Rails.application.routes.draw do
  get "/healthcheck", to: proc { [200, {}, ["OK"]] }
  namespace 'api' do
    resources :users do
      resources :companies
    end
    resources :packages do
      resources :operating_statements do
        resources :operating_statement_fields
      end
    end
    resources :sold_properties
    resources :rented_units
    resources :properties do
      resources :property_units
    end
    resources :addresses
    resources :package_sold_properties
    resources :package_rented_units
    post 'authenticate', to: '/api/authentication#authenticate'
    post 'passwords/request_reset', to: 'passwords#request_reset'
    post 'passwords/reset', to: 'passwords#reset'
    post 'user/customer_portal_url', to: 'users#pabbly_redirect'
  end
end
