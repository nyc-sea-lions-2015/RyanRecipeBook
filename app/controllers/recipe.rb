get '/recipes' do
  @recipes = Recipe.all
  erb :'recipe/all_recipes'
end
