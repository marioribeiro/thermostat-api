class ThermostatAPI < Sinatra::Base

  before do
    response.headers['Access-Control-Allow-Origin'] = '*'
  end

  get '/thermostats' do
    content_type :json
    Thermostat.all.to_json
  end

  post '/thermostats' do
    content_type :json
    Thermostat.create.to_json
  end

end