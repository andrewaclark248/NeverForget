class PhonesController < ApplicationController

    def index
        @phones = current_user.phones.where(active: true)
    end

    def manage
        phone = Phone.find_by(id: params[:id])
        @client = get_sub_account

        @messages = @client.messages.list(
            from: phone.phone_number
          )
    end

    def new_message
        @phone = Phone.find_by(id: params[:id])
    end

    def send_message
        @phone = Phone.find_by(id: params[:id])

        @client = get_sub_account


        message = @client.messages.create(
            body: params[:message][:message],
            from: @phone.phone_number,
            to: params[:message][:to]
          )
        
        if message.error_message.nil?
            flash[:notice] = "Message was sent."
            redirect_to phones_path# :index
        else
            flash[:error] = "Error sending message"
            redirect_to phones_path
        end
    end

    def purchase
        result = PurchasePhone.call(current_user: current_user)

        if result.success?
            customer = Stripe::Customer.create(email: self.email)
            self.user.update(stripe_customer_id: customer.id, plan: SILVER_USER)
        else
            flash[:error] = result.error
            render :manage
        end

        @client = Twilio::REST::Client.new("ACe94efa4a5bccafbcd7bf3d2d2f9166df", "829e5fa9183a5cce3c9b54c25aab5058")
        friendly_name = "user-#{current_user.id}"

        accounts = @client.api.v2010.accounts.list(
            friendly_name: friendly_name,
            limit: 20
          )

        #sub account not present
        if accounts.blank?
            sub_account = @client.api.v2010.accounts.create(friendly_name: friendly_name)
            current_user.update(sid: sub_account.sid, auth_token: sub_account.auth_token)
            @sub_account_client = Twilio::REST::Client.new(sub_account.sid, sub_account.auth_token)
        else
            @sub_account_client = Twilio::REST::Client.new(current_user.sid, current_user.auth_token)
        end
        #binding.pry
        local = @sub_account_client.available_phone_numbers('US').local.list(limit: 1).first
        #binding.pry

        incoming_phone_number = @sub_account_client.incoming_phone_numbers
                                       .create(phone_number: local.phone_number)
   
        current_user.phones.create(phone_number: local.phone_number)    

        @phones = current_user.phones

        redirect_to phones_path
    end

    def get_sub_account
        user_has_account_client = Twilio::REST::Client.new(ACCOUNT_SID, AUTH_TOKEN)
        friendly_name = "user-#{current_user.id}"

        accounts = user_has_account_client.api.v2010.accounts.list(
            friendly_name: friendly_name,
            limit: 20
          )

        #user already signed up and cant upgrade
        if accounts.blank?
            client = Twilio::REST::Client.new(current_user.sid, current_user.auth_token)

        else #not signed up
            sub_account = client.api.v2010.accounts.create(friendly_name: friendly_name)
            current_user.update(sid: sub_account.sid, auth_token: sub_account.auth_token)
            client = Twilio::REST::Client.new(sub_account.sid, sub_account.auth_token)
        end
        return client
    end


end