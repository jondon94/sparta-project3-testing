require 'httparty'
require 'json'
require 'sinatra'
require 'sinatra/reloader'
require 'pg'
require_relative '../../controllers/api_controllers/neo_controller'

class BrowseNeoData
  include HTTParty

  attr_accessor :brws_neo_id

  #by ID
  base_uri 'https://api.nasa.gov/neo/rest/v1/neo'

  def brws_neo_id(pgn)
    # @browse_neo_data = JSON.parse(self.class.get("/browse?page=#{pgn}&size=20&api_key=z9t2OsrUm9tT1D3ccMFVXzC69q6wN7K0CRXuJvQy").body)
    @browse_neo_data = JSON.parse(self.class.get("/browse?page=#{pgn}&size=20&api_key=IpR5py2pU7RR6B4XhVApfeOtIFdp2hYh6MsdMUgG").body)
  end

end
