require 'kramdown'

class Recipe
  attr_reader :title, :image_url, :description, :chef, :id, :tags

  def initialize(title:, image_url:, description:, chef:, id:, tags:)
    @title = title
    @image_url = image_url
    @description = apply_markdown(description)
    @chef = chef
    @id = id
    @tags = tags
  end

  private

  def apply_markdown(text)
    Kramdown::Document.new(text).to_html
  end
end
