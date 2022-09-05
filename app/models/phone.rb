class Phone < ApplicationRecord
    belongs_to :user
	

    attr_accessor :from
end