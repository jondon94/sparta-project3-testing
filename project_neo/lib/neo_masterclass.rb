require_relative 'services/neo_data'
require 'sinatra'
require 'sinatra/reloader'

class NeoDataTestClass

  def current_weather_info
    CurrentNeoData.new
  end

end
