require 'sinatra'
require "sinatra/reloader" if development?
require 'httparty'
require 'json'
require 'pg'

require_relative './controllers/neo_controller.rb'
# require_relative './lib/services/neo_data.rb'

use Rack::MethodOverride
run Rack::Cascade.new([
  NeoControl
])
