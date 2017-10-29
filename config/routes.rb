Rails.application.routes.draw do
	get 'welcome/index'

	resources :articles


	root 'articles#index'
end
