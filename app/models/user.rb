class User
  include DataMapper::Resource

  attr_reader :password

  property :id,      Serial
  property :api_key, String

  def self.authenticate(user_id, api_key)
    user = first(id: user_id)
    if user && user.api_key == api_key
      api_key
      user
    else
      nil
    end
  end

end
