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

  def send_password recipient_email, password, current_user
    @email = password.username
    @password = password.password
    @sender = current_user.full_name

    mail(
      to: recipient_email,
      subject: "Simple Logins - Shared Password"
    )
  end

  def email_change email
    @email = email

    mail(
      to: email,
      subject: "Simple Logins - Email Change"
    )
  end

end
