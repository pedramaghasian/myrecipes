require 'test_helper'

class RecipesTest < ActionDispatch::IntegrationTest


  def setup
    @chef = Chef.create!(chefname: "pedram", email: "pedram@yahoo.com")
    @recipe= Recipe.create(name: " dfdfsd", description: "dfsdfd",chef: @chef)
    @recipe2 = @chef.recipes.build(name: "dsfdsfs",description: "sdfdsf")
    @recipe2.save
  end

  test 'test recipes index' do
    get recipes_path
    assert_response :success
  end

  test 'should get recipes listing' do
    get recipes_path
    assert_template 'recipes/index'
    assert_match @recipe.name , response.body 
    assert_match @recipe2.name, response.body
  end

end
