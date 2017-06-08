class ThermostatAPI < Sinatra::Base

  enable :sessions
  use Rack::MethodOverride
  set :session_secret, 'thermostatapi'
  
end
