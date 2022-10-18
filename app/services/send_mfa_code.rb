class SendMfaCode

    include Interactor

    def call 
        context.login
        binding.pry
        if context.login.mfa_send_option == "phone"
            send_via_phone(context.login)
        else
            ApplicationMailer.send_mfa_code(context.login).deliver_now!
        end


    end


    def send_via_phone current_login
		@client = Twilio::REST::Client.new("ACe94efa4a5bccafbcd7bf3d2d2f9166df", "829e5fa9183a5cce3c9b54c25aab5058")

		message = "Hello From Simple Logins, \n \n Below is your MFA Code. \n \n Code: #{current_login.current_otp} \n \n \n Thanks,\n SimpleLogins"
        message = @client.messages.create(
            body: message,
            from: "+18448837863",
            to: current_login.mfa_phone #params["phoneNumber"]
          )
        
	end


end