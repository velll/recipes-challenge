require_relative './spec_helper'

RSpec.describe 'The HelloWorld App' do
  def app
    ApplicationController
  end

  let(:recipe_id) { SecureRandom.hex(10) }
  let(:bare_recipe_attrs) do
    {
      id: recipe_id,
      title: 'Falafel Pita Sandwich with Tahini Sauce',
      description: 'Preheat the oven to 230C. Place falafel on a baking sheet. Forget it and go buy some.'
    }
  end
  let(:recipe_attrs) { bare_recipe_attrs }
  let(:recipe) { Recipe.new(recipe_attrs) }

  before do
    allow(RecipesRepo).to receive(:find).with(recipe_id).and_return(recipe)
  end

  it 'shows recipe page with the bare minimum of attributes' do
    get "/recipes/#{recipe_id}"

    expect(last_response.status).to be 200

    expect(last_response.body).to include(recipe_attrs[:title])
    expect(last_response.body).to include(recipe_attrs[:description])
  end

  context 'full recipe attributes' do
    let(:recipe_attrs) do
      bare_recipe_attrs.merge({
                                image_url: 'http://example.com',
                                tags: ['vegan', 'easy'],
                                chef: 'Someone Incredibly Cool'
                              })
    end

    it 'shows recipe page with a complete set of attributes' do
      get "/recipes/#{recipe_id}"

      expect(last_response.status).to be 200

      expect(last_response.body).to include(recipe_attrs[:image_url])
      expect(last_response.body).to include(recipe_attrs[:tags][0])
      expect(last_response.body).to include(recipe_attrs[:tags][1])
      expect(last_response.body).to include(recipe_attrs[:chef])
    end
  end
end
