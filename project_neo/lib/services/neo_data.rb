require 'httparty'
require 'json'
require 'sinatra'
require 'sinatra/reloader'
require 'pg'
require_relative '../../controllers/neo_controller'

class CurrentNeoData
  include HTTParty

  attr_accessor :current_neo_data
  attr_accessor :current_neo_data_id

  #by ID
  base_uri 'https://api.nasa.gov/neo/rest/v1/neo'

  def get_neo_id(neo_reference_id)
    @current_neo_data_id = JSON.parse(self.class.get("/#{neo_reference_id}?api_key=z9t2OsrUm9tT1D3ccMFVXzC69q6wN7K0CRXuJvQy").body)
  end

  def neo_ex_id
    get_neo_id(3542519)
  end

  #by Date
  # base_uri 'https://api.nasa.gov/neo/rest/v1/feed?'
  #
  # def get_neo(start_date, end_date)
  #   @current_neo_data = JSON.parse(self.class.get("start_date=#{start_date}&end_date=#{end_date}&api_key=z9t2OsrUm9tT1D3ccMFVXzC69q6wN7K0CRXuJvQy").body)
  # end
  #
  # def neo_ex
  #   get_neo('2015-09-07', '2015-09-08')
  # end

end

x = CurrentNeoData.new
# p x.neo_ex_id
p x.get_neo_id(3729835).keys
# p x.get_neo_id(3729835)['estimated_diameter'].keys
# p x.get_neo_id(3729835)['close_approach_data'][0].keys
# p x.get_neo_id(3729835)['close_approach_data'][1].keys
# p x.get_neo_id(3729835)['close_approach_data'][2].keys
# p x.get_neo_id(3729835)['close_approach_data'][2]
# p x.get_neo_id(3729835)['close_approach_data'][2]['relative_velocity']
# p x.get_neo_id(3729835)['close_approach_data'][2]['miss_distance']
p x.get_neo_id(3729835)['orbital_data'].keys
# p x.get_neo_id(3542519)['orbital_data']['minimum_orbit_intersection']
# p x.get_neo_id(3542519)['orbital_data']['inclination']
# p x.get_neo_id(3542519)['orbital_data']['ascending_node_longitude']
p x.get_neo_id(3542519)['orbital_data']['orbital_period']
