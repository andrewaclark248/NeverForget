class PhonesController < ApplicationController

   #def index
   #     @phones = current_user.phones.where(active: true)
   # end

   # def messages
    #    phone = Phone.find_by(id: params[:id])
    #    result = GetTwilioSubAccount.call(current_user: current_user)

    #    @messages = result.client.messages.list(
    #        from: phone.phone_number
    #      )
    #end

    #def new_message
    #    @phone = Phone.find_by(id: params[:id])
    #end

    #def send_message
    #    @phone = Phone.find_by(id: params[:id])

    #    @client = get_sub_account


    #    message = @client.messages.create(
    #        body: params[:message][:message],
    #        from: @phone.phone_number,
    #        to: params[:message][:to]
    #      )
        
    #    if message.error_message.nil?
    #        flash[:notice] = "Message was sent."
    #        redirect_to phones_path# :index
    #    else
    #        flash[:error] = "Error sending message"
    #        redirect_to phones_path
    #    end
    #end



end