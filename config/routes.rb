Rails.application.routes.draw do
  root 'services#index'

  resources :services
  post 'services/move' => 'services#move', :as => :services_move
  get 'services/moveup/:id' => 'services#moveup', :as => :services_moveup
  get 'services/movedown/:id' => 'services#movedown', :as => :services_movedown
end
