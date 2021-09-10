require "contentful"
require_relative "recipe"

class RecipeProvider
  def initialize 
    @client = create_client
  end
  
  def get_all_recipes
    @client.entries(content_type: 'recipe').map do |entry| 
      build_recipe_from_contentful_entry(entry)
    end
  end

  def find_recipe_by(id)
    build_recipe_from_contentful_entry(@client.entry(id))
  end

  private

  def create_client
    client = Contentful::Client.new(
        space: 'kk2bw5ojx476',
        access_token: ENV["CONTENTFUL_ACCESS_TOKEN"],
        dynamic_entries: :auto
      )
  end

  def build_recipe_from_contentful_entry(entry)
    Recipe.new(
        title: entry.fields[:title], 
        image_url: @client.asset(entry.fields[:photo].id).image_url,
        description: entry.fields[:description],
        chef: entry.fields[:chef],
        id: entry.sys[:id],
        tags: entry.fields.key?(:tags) ? entry.tags : []) 
  end
end
