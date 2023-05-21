class KeysController < ApplicationController

	before_action :authenticate_user!
	before_action :search, only: [:index]

	def index
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
		key = Key.new(key: params[:key][:key], value: params[:key][:value], user: current_user)
		if key.save!
			flash[:notice] = "Key was created."
			redirect_to keys_path
		else
      		flash[:error] = key.errors.full_messages.to_sentence
			  redirect_to edit_key_path(key)  
		end
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

	private 

	def search
		if params["key-search"].blank?
			@key_search = Filter::Key.new
			keys = current_login.user&.keys
			add_pagination(keys)
		else
			model_atr = {"#{params["key-search"]}": "#{params["filter_key"]["radio_btn_value"]}", user: current_user}
			@key_search = Filter::Key.new(model_atr)
			add_pagination(@key_search.search) #@password_search.search
		end
	end

	def add_pagination keys
		@current_page = params[:page].present? ? params[:page] : "1"
		@keys = keys.paginate(page: @current_page, per_page: 8)
		@number_of_pages = (@keys.count/8.to_f).ceil
		@current_user = current_user
		@next_page = @current_page.to_i + 1
		@previous_page = @current_page.to_i - 1

		@previous_page_disabled = {}
		if @previous_page <=0 
			@previous_page_disabled["link-disabled"] = "disabled"
			@previous_page_disabled["text-color"] = "text-secondary"
		else
			@previous_page_disabled["link_disabled"] = ""
			@previous_page_disabled["text-color"] = "text-dark"
		end

		@next_page_disabled = {}
		if @next_page > @number_of_pages
			@next_page_disabled["link-disabled"] = "disabled"
			@next_page_disabled["text-color"] = "text-secondary"
		else
			@next_page_disabled["link-disabled"] = ""
			@next_page_disabled["text-color"] = "text-dark"
		end
	end



end