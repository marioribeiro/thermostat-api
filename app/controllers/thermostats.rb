class ThermostatAPI < Sinatra::Base

  before do
    response.headers['Access-Control-Allow-Origin'] = '*'
  end

  def get_current_temperature
    thermostat = Thermostat.get(@thermostat.id)
    thermostat.temperature
  end

  get '/thermostats' do
    content_type :json
    Thermostat.all.to_json
  end

  post '/thermostats' do
    content_type :json
    user = User.authenticate(params[:user_id], params[:api_key])
    if user
      session[:user_id] = user.id
      Thermostat.create(user_id: session[:user_id]).to_json
    else
      "Authentication Error - Check your User Id & API Key".to_json
    end
  end

  get '/thermostats/:id' do
    Thermostat.get(params[:id]).to_json
  end

  post '/thermostats/:id/temperature/increase' do
    @thermostat = Thermostat.get(params[:id])
    current_temperature = get_current_temperature
    @thermostat.update(:temperature => current_temperature += 1)
    @thermostat.to_json
  end

  post '/thermostats/:id/temperature/decrease' do
    @thermostat = Thermostat.get(params[:id])
    current_temperature = get_current_temperature
    @thermostat.update(:temperature => current_temperature -= 1)
    @thermostat.to_json
  end

  

end