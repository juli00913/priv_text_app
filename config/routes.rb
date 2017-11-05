Rails.application.routes.draw do

	resources :articles

	get 'messages/api/:id' => 'articles#show'
	post 'messages/api' => 'articles#create'

	root 'articles#index'
end
