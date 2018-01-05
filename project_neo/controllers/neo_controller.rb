require 'httparty'
require 'json'
require 'sinatra'
require 'sinatra/reloader'
require 'pg'
require_relative '../lib/services/neo_data'

class NeoControl < Sinatra::Base

  ##Sets root as parent directory of the current file
  set :root, File.join(File.dirname(__FILE__), "..")
  set :view, Proc.new { File.join(root, "views") }

  configure :development do
    register Sinatra::Reloader
  end

  # Comment these out for rspec tests
  $neo_pull = CurrentNeoData.new
  # $neo = CurrentNeoData.new
  # $neo = $neo_pull.neo_ex_id
  # $neo = $neo_pull.get_neo_id(3542519)
  # $neo = $neo_pull.get_neo_id('3729835')
  # $neo = $neo_pull.get_neo_id(neo_id_array)
  # $neo = $neo_pull.get_neo_id()
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

  get "/neo/:neo_reference_id" do
    # $neo = neo_reference_id
    # id = params[:neo_reference_id].to_i
    erb :'pages/show'
  end

  get '/neo' do
    # $neo = neo_reference_id
    erb :'pages/neo'
  end
end
