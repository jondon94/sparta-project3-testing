class PlanetControl < Sinatra::Base

  ##Sets root as parent directory of the current file
  set :root, File.join(File.dirname(__FILE__), "..")
  set :view, Proc.new { File.join(root, "views") }

  # configure :development do
  #   register Sinatra::Reloader
  # end

  get "/" do
    @title = 'Homepage'
    erb :'pages/homepage'
  end

  get "/planets" do
    @rock = Planets.all
    erb :'pages/planet_index'
  end

  get '/planets/new' do
    id = params[:id].to_i
    @rock = Planets.new
    erb :'pages/new'
  end

  get "/planets/:id" do
    @title = 'Planet'
    id = params[:id].to_i
    @rock = Planets.find(id)
    erb :'pages/planet_show'
  end

  post '/planets/' do
    planet = Planets.new
    planet.title = params[:title]
    planet.body = params[:body]
    planet.save
    redirect '/planets'
  end

  put '/planets/:id' do
    id = params[:id].to_i
    planet = Planets.find(id)
    planet.title = params[:title]
    planet.body = params[:body]
    planet.save
    redirect '/planets'
  end

  delete '/planets/:id' do
    id = params[:id].to_i
    Planets.destroy(id)
    redirect '/planets'
  end

  get '/planets/:id/edit' do
    id = params[:id].to_i
    @rock = Planets.find(id)
    erb :'pages/edit'
  end
end
