class ApplicationMailer < ActionMailer::Base
  default from: 'from@example.com'
  layout 'mailer'

  if Rails.env.development? == true
    # This overrides any "to" recipients
    ActionMailer::Base.register_interceptor(OverrideMailRecipient)
  end


  def send_mfa_code login
    @code = login.current_otp

    mail(
      to: login.mfa_email,
      subject: "Simple Logins - MFA Code"
    )
  end

end
