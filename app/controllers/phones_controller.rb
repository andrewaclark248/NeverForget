class PhonesController < ApplicationController

    def index
        @phones = current_user.phones
    end

    def manage
    end


    def purchase
        @client = Twilio::REST::Client.new(ACCOUNT_SID, AUTH_TOKEN)
        friendly_name = "user-#{current_user.id}"

        accounts = @client.api.v2010.accounts.list(
            friendly_name: friendly_name,
            limit: 20
          )

        #sub account not present
        if accounts.blank?
            sub_account = @client.api.v2010.accounts.create(friendly_name: friendly_name)
            current_user.update(sid: sub_account.sid, auth_token: ub_account.auth_token)
            @sub_account_client = Twilio::REST::Client.new(sub_account.sid, sub_account.auth_token)
        else
            @sub_account_client = Twilio::REST::Client.new(current_user.sid, current_user.auth_token)
        end

        local = @sub_account_client.available_phone_numbers('US').local.list(limit: 1).first
        #binding.pry

        incoming_phone_number = @sub_account_client.incoming_phone_numbers
                                       .create(phone_number: local.phone_number)
   
        current_user.phones.create(phone_number: local.phone_number)    

        @phones = current_user.phones

        render :index 
    end

end