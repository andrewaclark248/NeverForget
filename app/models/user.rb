class User < ApplicationRecord
  has_one :login
  has_many :passwords
  has_many :phones

  BRONZE_USER = "Bronze"      #no phone -> $0
  SILVER_USER = "Silver"      #1 phone  -> $5
  PLATNIUM_USER = "Platnium"  #2 phones -> $7
  GOLD_USER = "Gold"          #3 phones -> $9
  ADAMANTIUM_USER = "Titanium"  #4 phones -> $11

  PLANS = [BRONZE_USER, SILVER_USER, PLATNIUM_USER, GOLD_USER, ADAMANTIUM_USER]


  def has_phone_plan?
    self.stripe_customer_id.present?
  end

  def can_upgrade?
    return false if self.type == TITANIUM_USER
    return true
  end

  def name_of_upgraded_plan
    index = PLANS.index(self.type)
    return PLANS[index+1]
  end

  def friendly_name
    "user-#{self.id}"
  end

end