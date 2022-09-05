class User < ApplicationRecord
  has_one :login
  has_many :passwords
  has_many :phones

  after_create do
    customer = Stripe::Customer.create(email: self.login.email)
    self.update(stripe_customer_id: customer.id, plan: "Bronze")
  end

end