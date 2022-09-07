class Url < ApplicationRecord
  belongs_to :password, optional: true


  validate :parse_url


  def parse_url
    if self.name["http"].present?
      self.errors.add(:name, "cannot contain 'http'")
    end

    if self.name["www"].present?
      self.errors.add(:name, "cannot contain 'www'")
    end
  end

end