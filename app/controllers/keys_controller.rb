class KeysController < ApplicationController

	before_action :authenticate_user!

	def index
		@keys = current_user.keys
	end

	def new
		@key = Key.new
	end

	def create
		key = Key.new(key: params[:key][:key], value: params[:key][:value], user: current_user)
		if key.save!
			flash[:notice] = "Key was created."
			redirect_to keys_path
		else
      		flash[:error] = key.errors.full_messages.to_sentence
			  redirect_to new_key_path  
		end
	end



end