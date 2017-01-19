require 'test_helper'
class CreateCategoriesTest

  def setup
    @category = Category.create(name: "books")
    @category = Category.create(name: "programming")
  end

  test "should show categories listing" do
    get categories_path
    assert_template 'categories/index'
    assert_select 'a[href=?]', category_path(@category), text: @category.name
    assert_select 'a[href=?]', category_path(@category2), text: @category.name
  end

  test "should redirect create when admin not logged in" do
    assert_no_difference 'categories.count' do
      post :create, category: {name: "sports"}
    end
    assert_redirected_to categories_path
    end

end