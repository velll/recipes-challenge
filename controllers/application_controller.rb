class ApplicationController < Sinatra::Base
  get '/' do
    redirect '/recipes'
  end

  get '/recipes' do
    recipes = RecipesRepo.all

    erb :recipes, locals: { recipes: recipes }
  end

  get '/recipes/:id' do
    recipe = RecipesRepo.find(id)
    erb :recipes, locals: { recipes: [recipe] }
  end
end
