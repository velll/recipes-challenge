class ApplicationController < Sinatra::Base
  get '/' do
    redirect '/recipes'
  end

  get '/recipes' do
    erb :recipes, locals: { recipes: ['this', 'and', 'that'] }
  end

  get '/recipes/:id' do
    json({ title: 'not yet' })
  end
end
