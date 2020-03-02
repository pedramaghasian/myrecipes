require 'test_helper'

class RecipesDeleteTest < ActionDispatch::IntegrationTest


  def setup
    @chef = Chef.create!(chefname: "pedram", email: "pedram@yahoo.com",password: "password",password_confirmation: "password")
    @recipe= Recipe.create(name: " dfdfsd", description: "dfsdfd",chef: @chef)
  end

  test "successfully delete a recipe" do  
    get recipe_path(@recipe)
    assert_template 'recipe/show'
    assert_select 'a[href=?]',recipe_path(@recipe),text: "Delete this recipe"
    assert_difference 'Recipe.count', -1 do 
      delete recipe_path(@recipe)
    end
    assert_redirect_to recipes_path
    assert_not flash.empty?
  end
end
