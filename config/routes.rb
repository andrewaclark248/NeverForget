Rails.application.routes.draw do
  devise_for :logins
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html


	#devise_scope :user do
	#	get "/sessions" => "sessions"
	#end
	#root to: "logins/sign_in"

	#get "devise/sessions" => "devise/sessions#new"
  	root to: 'home#index'


	resources :dashboard
	#devise_for :users, controllers: { sessions: 'users/sessions' }

  

end
