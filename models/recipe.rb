# TODO! Dry-struct
class Recipe
  attr_accessor :id, :title, :image_url, :tags, :description, :chef

  def initialize(attrs)
    @id = attrs[:id]
    @title = attrs[:title]
    @image_url = attrs[:image_url]
    @tags = attrs[:tags]
    @description = attrs[:description]
    @chef = attrs[:chef]
  end
end
