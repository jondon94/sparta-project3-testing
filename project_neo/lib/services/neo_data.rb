require 'httparty'
require 'json'

class CurrentNeoData
  include HTTParty

  attr_accessor :current_neo_data
  attr_accessor :current_neo_data_id

  #by ID
  base_uri 'https://api.nasa.gov/neo/rest/v1/neo'

  def get_neo_id(id)
    @current_neo_data_id = JSON.parse(self.class.get("/#{id}?api_key=z9t2OsrUm9tT1D3ccMFVXzC69q6wN7K0CRXuJvQy").body)
  end


  #by Date
  # base_uri 'https://api.nasa.gov/neo/rest/v1/feed?'
  #
  # def get_neo(start_date, end_date)
  #   @current_neo_data = JSON.parse(self.class.get("start_date=#{start_date}&end_date=#{end_date}&api_key=z9t2OsrUm9tT1D3ccMFVXzC69q6wN7K0CRXuJvQy").body)
  # end

  def neo_ex
    get_neo('2015-09-07', '2015-09-08')
  end

  def neo_ex_id
    get_neo_id(3542519)
  end

end

x = CurrentNeoData.new
p x.neo_ex_id
# p x.neo_ex
