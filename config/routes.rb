Rails.application.routes.draw do

	root to: 'home#index'

  	devise_for :logins, controllers: {sessions: "sessions"}#,
	  #:path => '',
	  #:path_names => {
	#	sign_in: 'login',
	#	sign_out: 'logout',
	#	sign_up: 'register'
	#  }
  	# For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

	get '/ajax/get_new_password', to: 'ajax#get_new_password'

	get 'ajax/get_password/:id', to: 'ajax#get_password'

	resources :dashboard
	resources :user_passwords
	resources :payments, only: [:new, :create]
	resources :billing_portal, only: [:index]
	resources :phones do
		member do
			get 'messages', to: "phones#messages"
			post 'send_message', to: "phones#send_message"
			get 'new_message', to: "phones#new_message"
		end
		collection do
			get 'purchase', to: "phones#purchase"
		end
	end

	resources :webhooks, only: [:create]


  	namespace :api do
		namespace :v1 do
    		get 'get_credentials', to: 'credentials#get_credentials'
			post 'add_credentials', to: 'credentials#add_credentials'
		end
	  end
  

end
