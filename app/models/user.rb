class User
  include DataMapper::Resource

  attr_reader :password

  property :id,      Serial
  property :api_key, String

  has 1, :thermostat, :required => false

end
