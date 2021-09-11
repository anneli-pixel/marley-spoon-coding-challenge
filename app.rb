require "sinatra"
require "sinatra/reloader" if development?
require "pry-byebug"
require "better_errors"
require "contentful"

require_relative "recipe"
require_relative "recipe_provider"

get '/' do
  redirect "/recipes"
end

get '/recipes' do
  recipe_provider = RecipeProvider.new()
  @recipes = recipe_provider.get_all_recipes
  erb :recipes
end

get '/recipes/:id' do
  recipe_provider = RecipeProvider.new()
  @recipe = recipe_provider.find_recipe_by(params[:id])
  erb :show
end
