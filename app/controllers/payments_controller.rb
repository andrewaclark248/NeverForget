class PaymentsController < ApplicationController


    #payments page
    def new
        @current_plan = current_user.type
        @balance = 0
        @price_per_month = current_user.price_per_month
    end

    #cancel plan/update payment mehtod
    def billing_portal

    end

    #create/upgrade plan
    def create
        @session = Stripe::Checkout::Session.create({
            customer: current_user.stripe_customer_id,
            success_url: ENV["STRIPE_SUCCESS_URL"],
            cancel_url: ENV["STRIPE_FAILURE_URL"],
            payment_method_types: ['card'],
            line_items: [
              {price: "price_1LbWYwET8lfOTwqGkD94DDnX", quantity: 1},
            ],
            mode: 'subscription',
          })
          redirect_to @session.url
    end


    private

        def order_params
            #params.require(:order).permit(:product_id, :token, :payment_gateway, :charge_id)
        end

end
