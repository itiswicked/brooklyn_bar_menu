Rails.application.routes.draw do

  get 'menu/new',   to: 'menus#create'
  get 'menu/index', to: 'menus#index'
  get 'menu/:id',   to: 'menus#show'

end
