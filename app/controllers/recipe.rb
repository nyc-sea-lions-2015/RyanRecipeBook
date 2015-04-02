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
  @ingredients = Ingredient.all
  @new_recipe = Recipe.new(title: params[:title],
                           instruction: params[:instruction],
                           user_id: session[:user_id])

  if @new_recipe.save
    erb :'recipe/add_ingredient', layout: false, locals: {recipe: @new_recipe}
  else
    [404, "recipe did not save"]
  end
end

post '/recipe/:id/recipe_ingredient/new' do
  @ingredients = Ingredient.all
  @new_recipe_ingredient = RecipeIngredient.new(quantity: params[:quantity],
                                                recipe_id: params[:id],
                                                ingredient_id: params[:ingredient])

  if @new_recipe_ingredient.save
    erb :'recipe/add_ingredient', layout: false, locals: {recipe: Recipe.find_by(id: params[:id])}
  else
    [404, "recipe_ingredient did not save"]
  end
end




