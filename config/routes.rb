Rails.application.routes.draw do

	root to: 'home#index'

  	devise_for :logins, controllers: {sessions: "sessions", registrations: 'registrations' }, :path_names => { :sign_in => ""}

	#devise_scope :logins do
	#	get "login" => "devise/sessions#new"
		#get "/register" => "devise/registrations#new"
	#end  


	#get '/logins', to: 'home#index'

	#ajax request
	get '/ajax/get_new_password', to: 'ajax#get_new_password'
	get 'ajax/get_password/:id', to: 'ajax#get_password'
	get 'ajax/get_key/:id', to: 'ajax#get_key'
	post '/ajax/send_test_email', to: "ajax#send_test_email"

	#CRUD controllers
	resources :dashboard
	resources :payments, only: [:new, :create]
	resources :billing_portal, only: [:index]
	resources :keys
	resources :user_passwords do
		member do
			get "send_password_to_contact", to: "user_passwords#send_password_to_contact" 
			post "send_password_to_contact_via_email", to: "user_passwords#send_password_to_contact_via_email"
		end
	end
	resources :profiles do 
		member do
			post 'update_login', to: "profiles#update_login"
			post 'configure_mfa', to: "profiles#configure_mfa"
			post 'reset_password', to: "profiles#reset_password"
		end
	end
	
	#stripe webhooks
	resources :webhooks, only: [:create]

	#chrome extension api
  	namespace :api do
		namespace :v1 do
			resources :password

    		get 'get_credentials', to: 'credentials#get_credentials'
			post 'add_credentials', to: 'credentials#add_credentials'
			post 'chrome_password_turned_off', to: 'credentials#chrome_password_turned_off'
		end
	  end
  

end
