class BillingPortalController < ApplicationController

	before_action :authenticate_user!


    def index
        portal_session = Stripe::BillingPortal::Session.create({
            customer: current_user.stripe_customer_id,
            return_url: root_url,
          })
        redirect_to portal_session.url
    end

    private

        def order_params
            #params.require(:order).permit(:product_id, :token, :payment_gateway, :charge_id)
        end

end
