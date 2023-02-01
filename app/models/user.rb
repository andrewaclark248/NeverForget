class User < ApplicationRecord
  has_one :login
  has_many :passwords
  has_many :phones
  belongs_to :plan
  has_many :keys


  attr_accessor :mfa_enabled
  attr_accessor :mfa_send_option
  attr_accessor :mfa_phone
  attr_accessor :mfa_email
  attr_accessor :enable_tor #enable tor feature
  attr_accessor :email

  

  BRONZE_USER = "Bronze"      #no phone -> $0
  SILVER_USER = "Silver"      #1 phone  -> $5
  PLATNIUM_USER = "Platnium"  #2 phones -> $7
  GOLD_USER = "Gold"          #3 phones -> $9
  ADAMANTIUM_USER = "Adamantium"  #4 phones -> $11


  SILVER_PRICE = "price_1LbWYwET8lfOTwqGkD94DDnX"
  PLATNIUM_PRICE = "price_1LftW1ET8lfOTwqGjTjZKC7x"
  GOLD_PRICE = "price_1LftWdET8lfOTwqGXEqZnoNx"
  ADAMANTIUM_PRICE = "price_1LftXIET8lfOTwqGvCdEYP4O"

  STRIPE_PRICES = [SILVER_PRICE, PLATNIUM_PRICE, GOLD_PRICE, ADAMANTIUM_PRICE]


  PLANS = [BRONZE_USER, SILVER_USER, PLATNIUM_USER, GOLD_USER, ADAMANTIUM_USER]

  EXT_AUTOLOGOFF_2 = "2"
  EXT_AUTOLOGOFF_3 = "3"
  EXT_AUTOLOGOFF_4 = "4"


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

  def price_per_month
    return 0 if self.type == BRONZE_USER
    return 500 if self.type == SILVER_USER
    return 800 if self.type == PLATNIUM_USER
    return 1200 if self.type == GOLD_USER
    return 1600 if self.type == ADAMANTIUM_USER
  end

  def full_name
    self.first + " " + self.last
  end

  def chrome_pwd_manager_value
    if self.chrome_pwd_mng_toggle.nil?
      return "N/A"
    else
      return "Turned On" if self.chrome_pwd_mng_toggle
      return "Turned Off" if !self.chrome_pwd_mng_toggle
    end
  end

  def number_of_passwords_that_are_same user
		#user.passwords.group(:encrypted_password).having("count(*) > 1").load_records
		#binding.pry
	end

end