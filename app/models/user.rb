class User < ActiveRecord::Base

#  include VoteableIsm

	has_many :posts
	has_many :comments
  has_many :votes

  has_secure_password validations: false

  validates :username, presence: true, uniqueness: true
  validates :password, presence: true, length: {minimum: 3}

  after_validation :generate_slug


  def two_factor_auth?
    !self.phone.blank?
  end

  def generate_pin!
    self.update_column(:pin, rand(10 ** 6)) # generates random six digit number
  end

  def send_pin_to_twilio
    account_sid = 'AC19712ef809cda00a865ad91e9dc87991'
    auth_token = '73bdab89db17a949e2ae9ae009b67abd'

    # set up a client to talk to the Twilio REST API
    client = Twilio::REST::Client.new(account_sid, auth_token)

    msg = "Hi, please input the pin to log into Postit: #{self.pin}"
    account = client.account
    message = account.sms.messages.create({:from => '+19193238477', :to => self.phone, :body => msg})
  end

  def remove_pin!
    self.update_column(:pin, nil) # generates random six digit number
  end

  def generate_slug
    self.slug = self.username.gsub(' ', '-')
  end

  def to_param
    self.slug
  end

  def admin?
    self.role == 'admin'
  end

end