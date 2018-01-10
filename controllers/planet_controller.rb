# class PlanetControl < Sinatra::Base
#
#   ##Sets root as parent directory of the current file
#   set :root, File.join(File.dirname(__FILE__), "..")
#   set :view, Proc.new { File.join(root, "views") }
#
#   configure :development do
#     register Sinatra::Reloader
#   end
#
#   get "/planets" do
#     @rock = Planet.all
#   end
#
#   get "/planets/:id" do
#     @title = 'Planet'
#     id = params[:id].to_i
#     @rock = Planet.find(id)
#     erb :'pages/planet_show'
#   end
#
#   get '/planets/new_rock' do
#     @rock = Planets.new
#     erb :'pages/new_rock'
#   end
#
#   post '/planets' do
#     planet = Planets.new
#     planet.title = params[:title]
#     planet.body = params[:body]
#     planet.image = params[:image]
#     planet.save
#     redirect '/'
#   end
# end
