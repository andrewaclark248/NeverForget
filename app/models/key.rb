class Key < ApplicationRecord
  
    belongs_to :user
  
    attr_encrypted :key, key: ENV["ENCRYPTION_KEY"], mode: :single_iv_and_salt, salt: "somesalthahaha", iv: "7yHHhFVMldds"

    attr_encrypted :value, key: ENV["ENCRYPTION_KEY"], mode: :single_iv_and_salt, salt: "somesalthahaha", iv: "7yHHhFVMldds"


end