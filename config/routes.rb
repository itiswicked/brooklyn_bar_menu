Rails.application.routes.draw do

  resources :menus, only: [:index, :show, :new, :create]

end
