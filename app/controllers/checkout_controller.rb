class CheckoutController < ApplicationController

    def new
        @order = Order.new
    end

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
