class ApplicationMailer < ActionMailer::Base
  default from: 'from@example.com'
  layout 'mailer'

  if Rails.env.development? == true
    # This overrides any "to" recipients
    ActionMailer::Base.register_interceptor(OverrideMailRecipient)
  end
end
