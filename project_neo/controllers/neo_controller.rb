require 'httparty'
require 'json'
require 'sinatra'
require 'sinatra/reloader'
require 'pg'
require_relative '../lib/services/neo_data'
require_relative '../lib/services/neo_date_sel'
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
  $neo_id = CurrentNeoData.new
  $neo_id.get_neo_id(@id)
  $neo_date = CurrentNeoDataSel.new
  $neo_date.get_neo(@start, @end)
  # $neo = CurrentNeoData.new
  # $neo = $neo_pull.neo_ex_id
  # $neo = $neo_pull.get_neo_id(3542519)
  # $neo = $neo_pull.get_neo_id('3729835')
  # $neo = $neo_pull.get_neo_id(neo_id_array)
  # neo_reference_id = $neo_pull.get_neo_id(@current_neo_data_id)
  # id = $neo_pull.get_neo_id(@neo)

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

  get "/neo_browse" do
    @title = "Browse"
    # $neo_brws = BrowseNeoData.new
    erb :'pages/neo_browse'
  end
end
