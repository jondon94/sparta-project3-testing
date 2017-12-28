class NeoControl < Sinatra::Base
  include HTTParty

  ##Sets root as parent directory of the current file
  set :root, File.join(File.dirname(__FILE__), "..")
  set :view, Proc.new { File.join(root, "views") }

  configure :development do
    register Sinatra::Reloader
  end

  base_uri 'https://api.nasa.gov/neo/rest/v1/neo/'

  $current_neo_data = JSON.parse(self.class.get("#{id}?api_key=DEMO_KEY").body)

  get "/" do
    @title = 'Homepage'
    erb :'pages/homepage'
  end

  get "/neo" do
    @title = "Near Earth Objects"
    erb :'pages/neo_index'
  end
end
