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
    expect(last_response.body).to include('Cool recipes here')
  end

  # Errors

  it 'admits it cannot serve unknown routes' do
    get '/this-route-does-not-exist'
    expect(last_response.status).to be 404
  end
end
