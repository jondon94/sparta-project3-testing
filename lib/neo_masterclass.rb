require_relative 'services/neo_data'
require_relative '../spec/test_situations/cpybr_homepage'
require 'sinatra'


class NeoDataTestClass

  def current_neo_info
    CurrentNeoData.new
  end

  def nav_test
    NeoHmpg.new
  end

end
