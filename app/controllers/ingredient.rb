get '/ingredient/new' do
  erb :new_ingredient, layout: false
end

post '/ingredient/new' do
  @new_ingredient = Ingredient.new(name: params[:name])

  unless @new_ingredient.save
    [404, "did not save ingredient"]
  end
end
