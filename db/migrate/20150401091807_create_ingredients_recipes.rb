class CreateIngredientsRecipes < ActiveRecord::Migration
  def change
    create_table :recipe_ingredients do |t|
      t.string :quantity
      t.references :recipe
      t.references :ingredient
    end
  end
end
