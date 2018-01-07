require 'httparty'
require 'json'
require 'sinatra'
require 'sinatra/reloader'
require 'pg'
require_relative '../lib/services/neo_data'
require_relative '../lib/services/neo_browse'

class NeoControl < Sinatra::Base

  ##Sets root as parent directory of the current file
  set :root, File.join(File.dirname(__FILE__), "..")
  set :view, Proc.new { File.join(root, "views") }

  configure :development do
    register Sinatra::Reloader
  end

  # Comment these out for rspec tests
  $neo_brws = BrowseNeoData.new
  $neo_brws.brws_neo_id(@pgn)
  $neo_id = CurrentNeoData.new
  $neo_id.get_neo_id(@id)

  get "/" do
    @title = 'Homepage'
    erb :'pages/homepage'
  end

  get "/neo_index" do
    # $neo = neo_reference_id
    @title = "Near Earth Objects"
    erb :'pages/neo_index'
  end

  get "/neo/:id" do
    @id = params[:id].to_i
    # $neo = neo_reference_id
    erb :'pages/show'
  end

  get "/neo" do
    @title = "Near Earth Objects"
    # $neo = neo_reference_id
    erb :'pages/neo'
  end

  get "/neo_date" do
    erb :'pages/neo_date'
  end

  get "/neo_browse/:pgn" do
    @title = "Browse"
    @pgn = params[:pgn].to_i
    erb :'pages/neo_browse'
  end
end
