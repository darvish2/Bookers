Rails.application.routes.draw do

  devise_for :users

  resources :users,only: [:show,:index,:edit,:update]

  resources :books

  resources :post_images, only: [:new, :create, :index, :show]

  root 'homes#top'

  get 'home/about'

  get 'home/about' => 'home#about'

end