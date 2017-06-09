class Thermostat
  include DataMapper::Resource

  property :id,              Serial
  property :temperature,     Integer, :default => 20
  property :power_save_mode, Boolean, :default => true

  belongs_to :user

end
