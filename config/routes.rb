Rails.application.routes.draw do
  devise_for :logins
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  root to: "login#login"

	#devise_for :users, controllers: { sessions: 'users/sessions' }

  

end
