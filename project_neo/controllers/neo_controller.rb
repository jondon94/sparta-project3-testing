require_relative '../lib/services/neo_data'

class NeoControl < Sinatra::Base

  ##Sets root as parent directory of the current file
  set :root, File.join(File.dirname(__FILE__), "..")
  set :view, Proc.new { File.join(root, "views") }

  configure :development do
    register Sinatra::Reloader
  end

  $neo_pull = CurrentNeoData.new
  # $neo = $neo_pull.get_neo_id(3542519)
  $neo = $neo_pull.get_neo_id(3729835)

  get "/" do
    @title = 'Homepage'
    erb :'pages/homepage'
  end

  get "/neo" do
    # @title = "Near Earth Objects"
    @info = $neo
    erb :'pages/neo_index'
  end

  get "/neo/:id" do
    id = params[:id].to_i
    @info = $neo[id]
    erb :'pages/show'
  end
end
