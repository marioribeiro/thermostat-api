require 'data_mapper'
require 'dm-postgres-adapter'
require 'dm-timestamps'
require_relative 'models/thermostat'

DataMapper.setup(:default, ENV['DATABASE_URL'] || "postgres://localhost/thermostatapi")
DataMapper.finalize
DataMapper.auto_upgrade!
