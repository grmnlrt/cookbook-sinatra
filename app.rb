require "sinatra"
require "sinatra/reloader" if development?
require "pry-byebug"
require "better_errors"
require_relative "webapp/cookbook.rb"
configure :development do
  use BetterErrors::Middleware
  BetterErrors.application_root = File.expand_path('..', __FILE__)
end



get '/' do
  @csv_file   = File.join(__dir__, 'cookbook/recipes.csv')
  @cookbook   = Cookbook.new(@csv_file)
  @recipes = @cookbook.all
  erb :index
end

get '/destroy/:id' do
  @csv_file   = File.join(__dir__, 'cookbook/recipes.csv')
  @cookbook   = Cookbook.new(@csv_file)
  @cookbook.remove_recipe(params[:id].to_i)
  redirect '/'
end

get '/done/:id' do
  @csv_file   = File.join(__dir__, 'cookbook/recipes.csv')
  @cookbook   = Cookbook.new(@csv_file)
  @cookbook.mark_as_done_recipe(params[:id].to_i)
  redirect '/'
end

get '/done/:id' do
  @csv_file   = File.join(__dir__, 'cookbook/recipes.csv')
  @cookbook   = Cookbook.new(@csv_file)
  @cookbook.mark_as_done_recipe(params[:id].to_i)
  redirect '/'
end
