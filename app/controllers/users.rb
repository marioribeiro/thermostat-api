class ThermostatAPI < Sinatra::Base

  post '/users' do
    User.create(api_key: generate_api_key).to_json
  end

  def generate_api_key
    charset = %w{2 3 4 6 7 9 A C D E F G H J K M N P Q R T V W X Y Z}
    (0...6).map { charset.to_a[rand(charset.size)] }.join
  end

end

