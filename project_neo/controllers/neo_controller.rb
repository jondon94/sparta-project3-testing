require_relative '../lib/services/neo_data'

class NeoControl < Sinatra::Base

  ##Sets root as parent directory of the current file
  set :root, File.join(File.dirname(__FILE__), "..")
  set :view, Proc.new { File.join(root, "views") }

  configure :development do
    register Sinatra::Reloader
  end

  get "/" do
    @title = 'Homepage'
    erb :'pages/homepage'
  end

  get "/neo" do
    @title = "Near Earth Objects"
    erb :'pages/neo_index'
  end

  get "/neo/:id" do
    @title = 'Example'
    erb :'pages/neo_id'
  end
end
