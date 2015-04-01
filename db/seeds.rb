ryan = User.create(name: "Ryan", password: "1234")
toria = User.create(name: "Toria", password: "1234")

chicken_parm = Recipe.create(title: "Chicken Parm", instruction: "Bread it, bake it, eat it", user: ryan)

meat_pie = Recipe.create(title: "Meat pie", instruction: "make a crust pocket, fill with meat", user: toria)

Ingredient.create(name: "chicken")
Ingredient.create(name: "tomato sauce")
Ingredient.create(name: "chop meat")
Ingredient.create(name: "dough")

RecipeIngredient.create(recipe: chicken_parm, ingredient: Ingredient.find_by(name: "chicken"), quantity: 2)
RecipeIngredient.create(recipe: chicken_parm, ingredient: Ingredient.find_by(name: "tomato sauce"), quantity: 1)
