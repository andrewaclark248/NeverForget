class Login < ApplicationRecord
  #devise 

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :registerable, :recoverable, :rememberable, :validatable, :two_factor_authenticatable,
  :otp_secret_encryption_key => ENV['OTP_SECRET_KEY']


  #attr_encrypted :otp_secret, key: ENV["ENCRYPTION_KEY"], mode: :single_iv_and_salt, salt: "somesalthahaha", iv: "7yHHhFVMldds"


  belongs_to :user, optional: true

  after_create :set_user

  attr_accessor :first_name, :last_name


  def set_user
    plan = Plan.find_by(name: "Bronze")
		user = Bronze.new(first: first_name, last: last_name, plan: plan, chrome_ext_auto_logoff: "2")
    user.save!
    self.update!(user: user, otp_required_for_login: false)
  end

         
end
