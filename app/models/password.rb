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
				#binding.pry
				list_of_passwords = result_array.flatten.pluck(:encrypted_password) 
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

	def self.get_security_score user
		weak_passwords = user.passwords.where(pwd_strength: ["weak", "okay"]).count
		same_passwords = self.get_password_v2(user).flatten.count
		num_of_passwords = user.passwords.count
		weak_pass_count = num_of_passwords - weak_passwords
		same_pass_count = num_of_passwords - same_passwords
		total_errors = weak_pass_count + same_pass_count
		number_correct = num_of_passwords - total_errors
		security_score = ((number_correct.to_f/num_of_passwords.to_f)*100).to_i
		return security_score
	end


end