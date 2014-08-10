Rails.application.routes.draw do
  resources :hosts
  resources :services

  get "hosts/item/:id", to: "hosts#item", as: "hosts_item"

  root to: redirect('/hosts')
end
