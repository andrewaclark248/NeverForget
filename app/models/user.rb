class User < ApplicationRecord
  has_one :login
  has_many :passwords


end