Rails.application.routes.draw do
  resources :ip_addresses
  root 'ip_addresses#index'
end
