require 'httparty'
require 'json'
require 'sinatra'
require 'sinatra/reloader'
require 'pg'
require_relative '../../controllers/neo_controller'

class CurrentNeoDataSel
  include HTTParty

  attr_accessor :current_neo_data

  #by Date
  base_uri 'https://api.nasa.gov/neo/rest/v1/feed?'

  def get_neo(start_date, end_date)
    @current_neo_data = JSON.parse(self.class.get("start_date=#{start_date}&end_date=#{end_date}&api_key=z9t2OsrUm9tT1D3ccMFVXzC69q6wN7K0CRXuJvQy").body)
  end

  # def neo_ex
  #   get_neo('2015-09-07', '2015-09-08')
  # end

end
