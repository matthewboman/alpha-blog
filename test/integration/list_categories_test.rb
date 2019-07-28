require 'test_helper'

class ListCategoriesTest < ActionDispatch::IntegrationTest

  def setup
    @sports = Category.create(name: "sports")
    @programming = Category.create(name: "programming")
  end

  test "should show categories listing" do
    get categories_path
    assert_template "categories/index"
    assert_select "a[href=?]", category_path(@sports), text: @sports.name
    assert_select "a[href=?]", category_path(@programming), text: @programming.name
  end

end
