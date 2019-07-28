require 'test_helper'

class CategoryTest < ActiveSupport::TestCase

  def setup
    @category = Category.new(name: "sports")
  end

  test "category should be valid" do
    assert @category.valid?
  end

  test "name should be present" do
    @category.name = ""
    assert_not @category.valid?
  end

  test "name should be unique" do
    @category.save
    sports = Category.new(name: "sports")
    assert_not sports.valid?
  end

  test "name should not be too long" do
    @category.name = "ha" * 13
    assert_not @category.valid?
  end

  test "name should not be too short" do
    @category.name = "ha"
    assert_not @category.valid?
  end

end
