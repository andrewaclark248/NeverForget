class Login < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  belongs_to :user, optional: true

  after_create :set_user

  attr_accessor :first_name, :last_name


  def set_user
    plan = Plan.find_by(name: "Bronze")
		user = Bronze.new(first: first_name, last: last_name, plan: plan, chrome_ext_auto_logoff: EXT_AUTOLOGOFF_2)
    user.save!
    self.update!(user: user)
  end

         
end
