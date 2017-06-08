class Thermostat
  include DataMapper::Resource

  property :id,          Serial
  property :temperature, Integer
  property :created_at,  DateTime

  belongs_to :user

end
