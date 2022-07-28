class HomeController < ActionController::Base


	def index
		if current_login
			redirect_to dashboard_index_path
	    else
	      redirect_to new_login_session_path and return
	    end

	end

end
