require 'bcrypt'
require 'dm-validations'

class User

  attr_reader :password
  attr_accessor :password_confirmation



  include DataMapper::Resource

  property :id, Serial
  property :email, String
  property :password_digest, Text
  validates_confirmation_of :password

  def password=(password)
    @password = password
    self.password_digest = BCrypt::Password.create(password)
  end

end