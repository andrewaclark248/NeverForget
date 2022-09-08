class PurchasePhone
    include Interactor

    def call
        context.fail!(error: "Missing User") if context.current_user.nil?
        context.fail!(error: "Cant upgrade account. Contact customer service") if !context.current_user.can_upgrade?
        
        #create stripe account if not present
        if !context.current_user.has_phone_plan?
            customer = Stripe::Customer.create(email: self.email)
            self.user.update(stripe_customer_id: customer.id, plan: SILVER_USER)
        end
        
        #upgrade plan
        context.current_user.update(type: current_user.name_of_upgraded_plan)
        
        #purchase phone with twilio sub_account
        purchase_phone

        #upgrade stripe plan


    end

    def purchase_phone
        #get twilio sub account
        result = GetTwilioSubAccount.call(current_user: context.current_user)

        #purchase phone
        local = result.client.available_phone_numbers('US').local.list(limit: 1).first
        #binding.pry

        incoming_phone_number = result.client.incoming_phone_numbers.create(phone_number: local.phone_number)
    
        current_user.phones.create(phone_number: local.phone_number) 
    end

    def upgrade_stripe_plan

        Stripe::Subscription.update(
            'sub_1LeMvdET8lfOTwqGIUmCrN0O'
          )

    end

    

end