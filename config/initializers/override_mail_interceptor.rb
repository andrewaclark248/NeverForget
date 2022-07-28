class OverrideMailRecipient
  def self.delivering_email(mail)
    mail.to = "someuser@gmail.com"
  end
end
