require 'test_helper'

class RecipesEditTest < ActionDispatch::IntegrationTest

  def setup
    @chef = Chef.create!(chefname: "pedram", email: "pedram@yahoo.com",password: "password",password_confirmation: "password")
    @recipe= Recipe.create(name: " dfdfsd", description: "dfsdfd",chef: @chef)
  end
  
  test "reject invalid recipe update" do 
    get edit_recipe_path(@recipe)
    assert_template 'recipes/edit'
    patch recipe_path(@recipe),params: {recipe: {name:" ", description: " dfdsfsdfsdfsdf dfsd"}}
    assert_template 'recipes/edit'
    assert_select 'h2.panel-title'
    assert_select 'div.panel-body'
  end

  test "successfully edit a recipe "do  
    get edit_recipe_path(@recipe)
    assert_template 'recipes/edit'
    updated_name= " dkfjsdklfjskdlfjsdklf"
    updated_description = "dsfdsfsdfsdfdsfds"
    path recipe_path(@recipe),params: {recipe: {name: updated_name,description: updated_description}}
    assert_not flash.empty?
    @recipe.reload
    assert_match updated_name, @Recipe.name 
    assert_match updated_description, @Recipe.description
  end

end
