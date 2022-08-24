class User < ApplicationRecord
  has_one :login
  has_many :passwords
  has_many :phones

end