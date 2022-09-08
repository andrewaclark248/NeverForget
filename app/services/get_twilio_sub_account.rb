class GetTwilioSubAccount

    def call
        #create client
        user_has_account_client = Twilio::REST::Client.new(ACCOUNT_SID, AUTH_TOKEN)

        #see if twilio sub-account associated with user
        accounts = user_has_account_client.api.v2010.accounts.list(
            friendly_name: context.current_user.friendly_name,
            limit: 20
          )

        #if user already has twilio sub_account get client, else create twilio subaccount and client
        if accounts.blank?
            client = Twilio::REST::Client.new(context.current_user.sid, context.current_user.auth_token)
        else
            sub_account = client.api.v2010.accounts.create(friendly_name: friendly_name)
            current_user.update(sid: sub_account.sid, auth_token: sub_account.auth_token)
            client = Twilio::REST::Client.new(sub_account.sid, sub_account.auth_token)
        end
        context.client = client
    end
end