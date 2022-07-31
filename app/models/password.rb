class Password < ApplicationRecord
 	belongs_to :user
	has_many :urls
  
    attr_encrypted :password, key: 'cd994c18d13d85d20c2a9eaacfda609f', mode: :single_iv_and_salt, salt: "somesalthahaha", iv: "7yHHhFVMldds"#{}"".bytes[0..31].pack("cccccccccccccccccccc")#'z\x85\x84\xC2p\xE6D\xC3$\xF0\x9C\xFB\xB4C\x8B\xE4\xCE\x15\x17\xDB\x1F\x91\x8D\xE5s\xF1\xD9\xF5\x84\x95SF'


	attr_accessor :get_urls

	accepts_nested_attributes_for :urls, allow_destroy: true



end