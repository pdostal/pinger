Rails.application.routes.draw do
  root to: redirect('/hosts')

  resources :hosts
  resources :services
end
