require 'sinatra'
require "sinatra/reloader" if development?

require_relative './controllers/neo_controller.rb'

run NeoControl
