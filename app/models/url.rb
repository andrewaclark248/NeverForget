class Url < ApplicationRecord
  belongs_to :password, optional: true


  before_save :parse_url

  before_update :parse_url


  def parse_url
    #remove www
    #self.name = name.sub(/\Awww\./, '')

    #remove http
    #self.name = name.sub(/^https?\:\/\/(www.)?/,'')
  end

end