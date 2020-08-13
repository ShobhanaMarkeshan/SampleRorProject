Rails.application.routes.draw do
  # get 'products/index'
  # get 'products/new'
  # get 'products/create'
  # get 'products/show'
  # get 'products/edit'
  # get 'products/update'
  # get 'products/destroy'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root "welcome#home"
  # get 'about',to:'welcome#about'
  # get "user/new", to: "user#new"
  # post "user/new", to: "user#create"
  # get "user/index", to: "user#index"
  # get 'viewuser',to:'user#new'

  resources :users
  resources :products
end
