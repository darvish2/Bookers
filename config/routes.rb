Rails.application.routes.draw do
  get 'home/index'
	get 'top' => 'homes#top'
	root to: 'homes#top'

	resources :books

end