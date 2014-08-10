Rails.application.routes.draw do
  resources :hosts
  resources :services

  get "hosts/item/:id", to: "hosts#item", as: "hosts_item"
  get "services/item/:id", to: "services#item", as: "services_item"

  root to: redirect('/hosts')
end
