class Phone < ApplicationRecord
    belongs_to :user

    attr_accessor :from


    PHONE_LIMIT = 4
end