get '/recipes' do
  @recipes = Recipe.all
  erb :'recipe/all_recipes'
end

get '/recipe/new' do
  @ingredients = Ingredient.all
  if current_user
    erb :'recipe/new'
  else
    redirect '/signup'
  end
end

get '/recipe/:id' do
  @cur_recipe = Recipe.find_by(id: params[:id])
  erb :'recipe/recipe'
end

post '/recipe/new' do
  new_recipe = Recipe.new(title: params[:title],
                          instruction: params[:instruction],
                          user_id: session[:user_id])

  if new_recipe.save
    redirect "/user/#{current_user.id}"
  else
    [404, "recipe did not save"]
  end
end
