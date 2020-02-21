require 'test_helper'

class ChefTest < ActiveSupport::TestCase

  def setup
    @chef = Chef.new(chefname: "pedram",email: "pedram@example.com")
  end

  test "should be valid" do
    assert @chef.valid?
  end

  test "chefname should be present" do
    @chef.chefname = " "
    assert_not @chef.valid?
  end

  test "chefname should be less than 30 chars" do
    @chef.chefname = 'a' * 31
    assert_not @chef.valid?
  end

  test "email should be present" do
    @chef.email = " "
    assert_not @chef.valid?
  end

  test " email should not ve too long" do
    @chef.email= "a" * 245 + "@example.com"
    assert_not @chef.valid?
  end

  test "email shoulb accept correct format" do
    valid_emails = %w[user@example.com PEDRAM@gmial.com M.first@yahoo.ca john+smit@co.uk.org]
    valid_emails.each do |valids|
      @chef.email = valids 
      assert @chef.valid?, "#{valids.inspect} should be valid"
    end

  end

  test "should reject invalid email" do
    invalid_emails = %w[pedram@example pedram@example. ]
    invalid_emails.each do |invalids|
      @chef.email = invalids
      assert_not @chef.valid? , " #{invalids.inspect} should be valid"
    end
  end

  test "email should be uniqe and case insensitive" do
    duplicate_chef = @chef.dup
    duplicate_chef.email = @chef.email.upcase
    @chef.save
    assert_not duplicate_chef.valid?
  end

  test "emael should ve lower before save" do
    mixed_email = "pedram@example.com"
    @chef.email = mixed_email
    @chef.save
    assert_equal mixed_email.downcase, @chef.reload.email
  end
end

