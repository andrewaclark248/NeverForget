class GetTwilioSubAccount
    include Interactor

    def call
        #create client
        user_has_account_client = Twilio::REST::Client.new("ACe94efa4a5bccafbcd7bf3d2d2f9166df", "829e5fa9183a5cce3c9b54c25aab5058")

        #see if twilio sub-account associated with user
        accounts = user_has_account_client.api.v2010.accounts.list(
            friendly_name: context.current_user.friendly_name,
            limit: 20
          )
          #if user already has twilio sub_account get client, else create twilio subaccount and client
        if accounts.present?
            client = Twilio::REST::Client.new(context.current_user.sid, context.current_user.auth_token)
        else
            sub_account = user_has_account_client.api.v2010.accounts.create(friendly_name: context.current_user.friendly_name)
            context.current_user.update(sid: sub_account.sid, auth_token: sub_account.auth_token)
            client = Twilio::REST::Client.new(sub_account.sid, sub_account.auth_token)
        end
        context.client = client
    end
end