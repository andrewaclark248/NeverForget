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
	

end