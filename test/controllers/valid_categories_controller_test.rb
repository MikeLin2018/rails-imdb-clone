require 'test_helper'

class ValidCategoriesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @valid_category = valid_categories(:one)
  end

  test "should get index" do
    get valid_categories_url
    assert_response :success
  end

  test "should get new" do
    get new_valid_category_url
    assert_response :success
  end

  test "should create valid_category" do
    assert_difference('ValidCategory.count') do
      post valid_categories_url, params: { valid_category: {  } }
    end

    assert_redirected_to valid_category_url(ValidCategory.last)
  end

  test "should show valid_category" do
    get valid_category_url(@valid_category)
    assert_response :success
  end

  test "should get edit" do
    get edit_valid_category_url(@valid_category)
    assert_response :success
  end

  test "should update valid_category" do
    patch valid_category_url(@valid_category), params: { valid_category: {  } }
    assert_redirected_to valid_category_url(@valid_category)
  end

  test "should destroy valid_category" do
    assert_difference('ValidCategory.count', -1) do
      delete valid_category_url(@valid_category)
    end

    assert_redirected_to valid_categories_url
  end
end
