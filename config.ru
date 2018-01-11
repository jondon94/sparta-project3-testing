require 'sinatra'
# require "sinatra/reloader" if development?
require 'httparty'
require 'json'
require 'pg'
require_relative './models/planets.rb'
require_relative './controllers/planet_controller.rb'
require_relative './controllers/api_controllers/neo_controller.rb'
# require_relative './lib/services/neo_data.rb'

use Rack::MethodOverride
run Rack::Cascade.new([
  PlanetControl, NeoControl
])
