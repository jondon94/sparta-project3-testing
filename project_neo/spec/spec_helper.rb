require 'json'
require_relative '../lib/neo_masterclass'
require 'httparty'
require 'sinatra'
require 'sinatra/reloader'

RSpec.configure do |config|
  config.formatter = :documentation
end
