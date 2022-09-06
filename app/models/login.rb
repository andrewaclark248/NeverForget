class Login < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  belongs_to :user, optional: true

  after_create :set_user

  attr_accessor :user_type

  def set_user
		user = Bronze.new(first: "TBD", last: "TBD")
    user.save!
    self.update!(user: user)
    customer = Stripe::Customer.create(email: self.email)
    self.user.update(stripe_customer_id: customer.id, plan: "Bronze")
  end

         
end
