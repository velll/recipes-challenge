require_relative './spec_helper'

RSpec.describe 'The HelloWorld App' do
  def app
    ApplicationController
  end

  it 'says hello' do
    get '/'
    expect(last_response.status).to be 302
  end

  it 'shows recipes' do
    get '/recipes'
    expect(last_response.status).to be 200
    expect(last_response.body).to include('Marley Spoon recipe challenge')
  end

  # Errors

  it 'admits it cannot serve unknown routes' do
    get '/this-route-does-not-exist'
    expect(last_response.status).to be 404
  end

  context 'internal server errors' do
    before do
      allow(RecipesRepo).to receive(:all) do
        1 / 0
      end
    end

    it 'returns 500 and shows an incredibly helpful message on internal server errors' do
      get '/recipes'

      expect(last_response.status).to be 500
      expect(last_response.body).to include('engine oil')
    end
  end
end
