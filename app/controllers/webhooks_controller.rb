class WebhooksController < ApplicationController
    skip_before_action :authenticate_user!, raise: false
    skip_before_action :verify_authenticity_token

    SUBSCRIPTION_STATUS_INCOMPLETE = "incomplete"
    SUBSCRIPTION_STATUS_ACTIVE = "active"
    SUBSCRIPTION_STATUS_INCOMPLETE_EXP = "incomplete_expired"
    SUBSCRIPTION_PAST_DUE = "past_due"
    SUBSCRIPTION_UNPAID = "unpaid"
    
    def create
      #if success update
        #update current_user.type and current_user.plan
        #purchase phone
      #else


      payload = request.body.read
      sig_header = request.env['HTTP_STRIPE_SIGNATURE']
      event = nil
  
      begin
        event = Stripe::Webhook.construct_event(payload, sig_header, "whsec_lOCuugtVSH9S1u0fFrOiZhGO68zWv2p3")
      rescue JSON::ParserError => e
        status 400
        return
      rescue Stripe::SignatureVerificationError => e
        # Invalid signature
        puts "Signature error"
        p e
        return
      end


      # Handle the event
      case event.type
      when 'customer.created'
        #potential
        #customer = event.data.object
        #@user = User.find_by(email: customer.email)
        #@user.update(stripe_customer_id: customer.id)
      when 'customer.subscription.updated', 'customer.subscription.deleted', 'customer.subscription.created'
        #get subscribtion
        subscription = event.data.object
        #get user/plan
        user = User.find_by(stripe_customer_id: subscription.customer)
        plan = Plan.find_by(stripe_price_id: subscription.items.data[0].price.id)
        #update plan to bronze if subscription unpaid
        user_plan = get_new_user_plan(subscription.status, plan)
        user.update(plan: user_plan, type: user_plan.name)

        upgrade_or_downgrade_phones(user, user.plan)
      when 'customer.subscription.canceled'
        binding.pry
        #get subscribtion
        subscription = event.data.object
        #get user/plan
        user = User.find_by(stripe_customer_id: subscription.customer)
        plan = Plan.find_by(stripe_price_id: subscription.items.data[0].price.id)
        #update plan to bronze if subscription unpaid
        user_plan = get_new_user_plan(subscription.status, plan)
        user.update(plan: user_plan, type: user_plan.name)

        upgrade_or_downgrade_phones(user, user.plan)

      end
  
      render json: { message: 'success' }
    end

    #update plan to bronze if subscription unpaid
    def get_new_user_plan subscription_status, plan
      user_plan = nil
      if subscription_status == SUBSCRIPTION_UNPAID
        plan = Plan.find_by(name: "Bronze")
        user_plan = plan
      else
        user_plan = plan
      end
      return user_plan
    end

    #upgrade phones
    def upgrade_or_downgrade_phones user, plan
      user_phones = user.phones.where(active: true).count
      number_of_phones = get_number_of_phones(plan)

      if user_phones == number_of_phones
        #change nothing
      elsif user_phones < number_of_phones
        result = number_of_phones - user_phones
        result.times do 
          purchase_phone(user)
        end
      elsif user_phones > number_of_phones
        result = user_phones - number_of_phones
        result.times do 
          phone = user.phones.where(active: true).order(id: :asc).last
          phone.update(active: false)
        end
      end
    end

    #purchase phone
    def purchase_phone user
      #get twilio sub account
      result = GetTwilioSubAccount.call(current_user: user)
      #purchase phone
      local = result.client.available_phone_numbers('US').local.list(limit: 1).first

      incoming_phone_number = result.client.incoming_phone_numbers.create(phone_number: local.phone_number)
  
      user.phones.create(phone_number: local.phone_number, active: true)


    end

    #get number of phones based on plan
    def get_number_of_phones plan
      return 0 if plan.name == "Bronze"
      return 1 if plan.name == "Silver"
      return 2 if plan.name == "Platnium"
      return 3 if plan.name == "Gold"
      return 4 if plan.name == "Adamantium"
    end

  end


  #subscription.status
  #active == The subscription is in good standing and the most recent payment is successful
  #incomplete == A successful payment needs to be made within 23 hours to activate the subscription
  #incomplete_expired == The initial payment on the subscription failed and no successful payment was made within 23 hours of creating the subscription
  #past_due == Payment on the latest finalized invoice either failed or wasn’t attempted
  #unpaid == 	The latest invoice hasn’t been paid but the subscription remains in place