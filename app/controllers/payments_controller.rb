class PaymentsController < ApplicationController


    #payments page
    def new
        @current_plan = current_user.type
        @balance = 0
        @price_per_month = current_user.price_per_month
        @plans = Plan.where.not(name: "Bronze")
    end

    #cancel plan/update payment mehtod
    def billing_portal

    end

    #create/upgrade plan
    def create
        if payment_params[:plan].blank?
            flash[:error] = "Please provide a plan!"
            redirect_to new_payment_path
        else
            #execute stripe api
            plan = Plan.find_by(name: payment_params[:plan])

            @session = Stripe::Checkout::Session.create({
                customer: current_user.stripe_customer_id,
                success_url: ENV["STRIPE_SUCCESS_URL"],
                cancel_url: ENV["STRIPE_FAILURE_URL"],
                payment_method_types: ['card'],
                line_items: [
                {price: plan.stripe_price_id, quantity: 1},
                ],
                mode: 'subscription',
            })
            redirect_to @session.url
        end
    end

    private
        def payment_params
            params.require(:payment).permit(:plan)
        end

end
