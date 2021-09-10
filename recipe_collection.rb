require "contentful"
require_relative "recipe"

class RecipeCollection

  def initialize 
    @client = create_client
    @recipes = create_recipes
  end

  def all
    return @recipes
  end

  private

  def create_client
    client = Contentful::Client.new(
        space: 'kk2bw5ojx476',
        access_token: ENV["CONTENTFUL_ACCESS_TOKEN"],
        dynamic_entries: :auto
      )
  end

  def create_recipes
    @client.entries(content_type: 'recipe').each do |entry|
      @recipes << Recipe.new(title: entry.fields[:title])
    end
    return @recipes
  end
end