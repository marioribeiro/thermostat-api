require_relative 'models/thermostat'

DataMapper.setup(:default, ENV['DATABASE_URL'] || "postgres://localhost/thermostatapi")
DataMapper.finalize
DataMapper.auto_upgrade!
