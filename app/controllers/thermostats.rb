class ThermostatAPI < Sinatra::Base

  before do
    response.headers['Access-Control-Allow-Origin'] = '*'
  end

  def get_current_temperature
    thermostat = Thermostat.get(@thermostat.id)
    thermostat.temperature
  end

  get '/thermostats' do
    return_message = {}
    if Thermostat.count == 0
      return_message[:status] = 'success'
      return_message[:thermostats] = 'there are no thermostats'
    else
      return_message[:status] = 'success'
      return_message[:thermostats] = Thermostat.all
    end
    return_message.to_json
  end

  post '/thermostats' do
    return_message = {}
    content_type :json
    user = User.authenticate(params[:user_id], params[:api_key])
    if user
      session[:user_id] = user.id
      thermostat = Thermostat.create(user_id: session[:user_id])
      return_message[:status] = 'sucess'
      return_message[:thermostat] = thermostat
    else
      return_message[:status] = 'error'
      return_message[:message] = 'Please check your User ID and API Key'
      return_message.to_json
    end
  end

  get '/thermostats/:id' do
    return_message = {}
    thermostat = Thermostat.get(params[:id])
    if thermostat
      return_message[:status] = 'sucess' 
      return_message[:thermostat] = thermostat
    else
      return_message[:status] = 'error'
      return_message[:message] = 'Invalid ID. Thermostat not found'
    end
    return_message.to_json 
  end

  post '/thermostats/:id/temperature/increase' do
    return_message = {}
    @thermostat = Thermostat.get(params[:id])
    current_temperature = get_current_temperature
    @thermostat.update(:temperature => current_temperature += 1)
    return_message[:status] = 'success'
    return_message[:thermostat] = @thermostat
    return_message.to_json
  end

  post '/thermostats/:id/temperature/decrease' do
    return_message = {}
    @thermostat = Thermostat.get(params[:id])
    current_temperature = get_current_temperature
    @thermostat.update(:temperature => current_temperature -= 1)
    return_message[:status] = 'success'
    return_message[:thermostat] = @thermostat
    return_message.to_json
  end

end
