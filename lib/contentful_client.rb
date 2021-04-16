require 'contentful'

module BuildContentfulClient
  extend self

  def call(_space_id, _access_token)
    Contentful::Client.new(
      space: ENV['CONTENTFUL_SPACE_ID'],
      access_token: ENV['CONTENTFUL_ACCESSS_TOKEN'],
      dynamic_entries: :auto
    )
  end
end
