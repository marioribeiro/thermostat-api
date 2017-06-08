class Thermostat
  include DataMapper::Resource

  property :id,          Serial
  property :temperature, Integer, :default => 20

  belongs_to :user

end
