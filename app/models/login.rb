class Login < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  belongs_to :user, optional: true

  after_create :set_user

  def set_user
    plan = Plan.find_by(name: "Bronze")
		user = Bronze.new(first: "N/A", last: "N/A", plan: plan)
    user.save!
    self.update!(user: user)

  end

         
end
