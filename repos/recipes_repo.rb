class RecipesRepo < ContentfulRepo
  self.content_type = 'recipe'

  def self.coerce_single_entry(entry)
    fields = entry.fields

    attributes = {
      title: fields[:title],
      description: fields[:description]
    }.tap do |attrs|
      attrs[:image_url] = fields[:photo].url if fields[:photo]
      attrs[:tags] = fields[:tags].map { |tag| tag.name } if fields[:tags]
      attrs[:chef] = fields[:chef].name if fields[:chef]
    end

    Recipe.new(attributes)
  end
end
