get '/recipes' do
  @recipes = Recipe.all
  erb :'recipe/all_recipes'
end

get '/recipe/:id' do
  @cur_recipe = Recipe.find_by(id: params[:id])
  erb :'recipe/recipe'
end

get '/recipe/new' do
  if current_user
    erb :'recipe/new'
  else
    redirect '/signup'
  end
end
