require 'sinatra'
require "sinatra/reloader" if development?
require 'httparty'
require 'json'

require_relative './controllers/neo_controller.rb'

run NeoControl
