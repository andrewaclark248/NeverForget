class KeysController < ApplicationController

	before_action :authenticate_user!

	def index
		@keys = current_user.keys
		@current_user = current_user
	end

	def new
		@key = Key.new
	end

	def edit
		@key = Key.find_by(id: params[:id])
	end

	def update
		@key = Key.find_by(id: params[:id])
		if @key.update(key: params[:key][:key], value: params[:key][:value])
			flash[:notice] = "Key was updated."
			redirect_to keys_path
		else
      		flash[:error] = @key.errors.full_messages.to_sentence
			  redirect_to new_key_path  
		end
	end

	def create
		binding.pry
		redirect_to keys_path
		#key = Key.new(key: params[:key][:key], value: params[:key][:value], user: current_user)
		#if key.save!
		#	flash[:notice] = "Key was created."
		#	redirect_to keys_path
		#else
      	#	flash[:error] = key.errors.full_messages.to_sentence
		#	  redirect_to edit_key_path(key)  
		#end
	end


	def destroy
		key = Key.find_by(id: params[:id])
		if key.destroy
			flash[:notice] = "Password was deleted."
			redirect_to keys_path
		else
			flash[:error] = "Error during deleting password."
			redirect_to keys_path
		end
	end



end