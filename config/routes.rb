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



	resources :dashboard
	resources :user_passwords
	resources :checkout, only: [:new, :create]
	resources :billing_portal, only: [:create]
	resources :phones do
		member do
			get 'manage', to: "phones#manage"
			post 'send_message', to: "phones#send_message"
			get 'new_message', to: "phones#new_message"
		end
		collection do
			get 'purchase', to: "phones#purchase"
		end
	end


  	namespace :api do
		namespace :v1 do
    		get 'get_credentials', to: 'credentials#get_credentials'
		end
	  end
  

end
