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
    user = User.authenticate(params[:user_id], params[:api_key])
    if user
      session[:user_id] = user.id
      Thermostat.create(user_id: session[:user_id]).to_json
    else
      "Authentication Error - Check your User Id & API Key".to_json
    end
  end

  

end