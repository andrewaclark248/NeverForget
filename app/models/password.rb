class Password < ApplicationRecord
 	belongs_to :user
	has_many :urls, dependent: :destroy
  
    attr_encrypted :password, key: ENV["ENCRYPTION_KEY"], mode: :single_iv_and_salt, salt: "somesalthahaha", iv: "7yHHhFVMldds"

	attr_accessor :get_urls

	accepts_nested_attributes_for :urls, allow_destroy: true


	validates :password, :presence => true
	validates :username, :presence => true


	STRENGTH_POOR = "poor"
	STRENGTH_OKAY = "okay"
	STRENGTH_STRONG = "strong"
	
	def self.get_password_v2 user
		user_passwords = user.passwords
		result_array = []
		user_passwords.each do |password|
			if result_array&.count > 0
				list_of_passwords = result_array.pluck(:encrypted_password) 
			end
			if list_of_passwords&.include?(password.encrypted_password)
				next
			end 
			same_password = user.passwords.where(encrypted_password: password.encrypted_password)
			if same_password.count > 1
				result_array.push(same_password)
			end
		end
		return result_array
	end


end