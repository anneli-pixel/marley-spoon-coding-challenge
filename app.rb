require "sinatra"
require "sinatra/reloader" if development?
require "pry-byebug"
require "better_errors"
require "contentful"

configure :development do
  use BetterErrors::Middleware
  BetterErrors.application_root = File.expand_path('..', __FILE__)
end

require_relative "recipe"
require_relative "recipe_collection"

get '/' do
  recipe_collection = RecipeCollection.new()
  @recipes = recipe_collection.all
  erb :recipes
end

get '/recipes/:index' do
  'Recipe view'
end