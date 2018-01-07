require_relative 'services/neo_data'
require_relative '../views/pages/cpybr_homepage'
require 'sinatra'
require 'sinatra/reloader'

class NeoDataTestClass

  def current_neo_info
    CurrentNeoData.new
  end

  def nav_test
    NeoHmpg.new
  end

end
