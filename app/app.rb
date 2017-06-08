ENV['RACK_ENV'] ||= 'development'

require 'sinatra/base'

require_relative 'server'
require_relative 'data_mapper_setup'
require_relative 'controllers/users'
require_relative 'controllers/thermostats'
