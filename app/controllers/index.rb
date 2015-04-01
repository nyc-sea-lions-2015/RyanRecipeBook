get '/' do
  erb :index, locals: {recipe_list: Recipe.all}
end
