require 'httparty'
require 'json'
require 'sinatra'
require 'sinatra/reloader'
require 'pg'
require_relative '../../controllers/neo_controller'

class CurrentNeoData
  include HTTParty

  attr_accessor :current_neo_data_id
  attr_accessor :multi_NEO_data

  #by ID
  base_uri 'https://api.nasa.gov/neo/rest/v1/neo'

  def get_neo_id(id)
    # neo_id_array = ['3729835', '3542519']
    @current_neo_data_id = JSON.parse(self.class.get("/#{id}?api_key=z9t2OsrUm9tT1D3ccMFVXzC69q6wN7K0CRXuJvQy").body)
    # @multi_NEO_data = JSON.parse(self.class.post('/neo_reference_id', body: {"?api_key=z9t2OsrUm9tT1D3ccMFVXzC69q6wN7K0CRXuJvQy" => neo_id_array}).body)
  end

end

# x = CurrentNeoData.new

# p x.neo_ex_id
# p x.get_neo_id(3729835).keys
# p x.get_neo_id(3729835)['estimated_diameter'].keys
# p x.get_neo_id(3729835)['close_approach_data'][0].keys
# p x.get_neo_id(3729835)['close_approach_data'][1].keys
# p x.get_neo_id(3729835)['close_approach_data'][2].keys
# p x.get_neo_id(3729835)['close_approach_data'][2]['close_approach_date']
# p x.get_neo_id(3729835)['close_approach_data'][2]['relative_velocity']
# p x.get_neo_id(3729835)['close_approach_data'][2]['miss_distance']
# p x.get_neo_id(3729835)['orbital_data'].keys
# p x.get_neo_id(3542519)['orbital_data']['minimum_orbit_intersection']
# p x.get_neo_id(3542519)['orbital_data']['inclination']
# p x.get_neo_id(3542519)['orbital_data']['ascending_node_longitude']
# p x.get_neo_id(3542519)['orbital_data']['orbital_period']
