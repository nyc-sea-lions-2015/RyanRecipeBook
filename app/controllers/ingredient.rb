# The routing here is a little bit off.  just a tad.
#
# To see the new thing you have the right route: /things/new  When you add a
# new "thing" to the collection of things in the universe, the Rails standard
# route name (and REST typical route name) is to POST /things
#
#See also: http://guides.rubyonrails.org/routing.html#crud-verbs-and-actions
#
get '/ingredient/new' do
  erb :new_ingredient, layout: false
end

post '/ingredient/new' do
  @new_ingredient = Ingredient.new(name: params[:name])

  unless @new_ingredient.save
    [404, "did not save ingredient"]
  end
end
