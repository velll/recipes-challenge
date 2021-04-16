require 'dry/container'

class ContentfulRepo
  extend Dry::Container::Mixin

  class << self
    attr_accessor :content_type

    def connect(client)
      register :client, client
    end

    def client
      ContentfulRepo.resolve :client
    end

    def find(id, query = {})
      result = entry(id, final_query(query))
      raise Sinatra::NotFound unless result

      coerce_single_entry(result)
    end

    # TODO: pagination
    def all(query = {})
      results = entries(final_query(query)).entries

      results.map { |result| coerce_single_entry(result) }
    end

    private

    def default_query
      { content_type: content_type }
    end

    def final_query(query)
      default_query.merge(query)
    end

    def entry(id, query)
      client.entry(id, query)
    end

    def entries(query)
      client.entries({ content_type: content_type }.merge(query))
    end

    def coerce_single_entry(_entry)
      raise NotImplementedError, 'Abstract coerce not implemented'
    end
  end
end
