require_relative '../lib/services/neo_data'
require_relative '../lib/services/neo_browse'

class NeoControl < Sinatra::Base

  ##Sets root as parent directory of the current file
  set :root, File.join(File.dirname(__FILE__), "..")
  set :view, Proc.new { File.join(root, "views") }

  configure :development do
    register Sinatra::Reloader
  end

  $neo_brws = BrowseNeoData.new
  $neo_brws.brws_neo_id(@pgn)

  get "/" do
    @title = 'Homepage'
    erb :'pages/homepage'
  end

  get "/neo_browse/:pgn" do
    @title = "Browse"
    @pgn = params[:pgn].to_i
    @id = params[:id].to_i
    erb :'pages/neo_browse'
  end

  get "/neo_browse/:pgn/:id" do
    @pgn = params[:pgn].to_i
    @id = params[:id].to_i
    erb :'pages/show'
  end

  get "/neo" do
    @title = "Near Earth Objects"
    erb :'pages/neo'
  end

  get "/planets/:id" do
    id = params[:id].to_i
    erb :'pages/planet_show'
  end

end
