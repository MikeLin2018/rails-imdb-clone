require "application_system_test_case"

class ValidCategoriesTest < ApplicationSystemTestCase
  setup do
    @valid_category = valid_categories(:one)
  end

  test "visiting the index" do
    visit valid_categories_url
    assert_selector "h1", text: "Valid Categories"
  end

  test "creating a Valid category" do
    visit valid_categories_url
    click_on "New Valid Category"

    click_on "Create Valid category"

    assert_text "Valid category was successfully created"
    click_on "Back"
  end

  test "updating a Valid category" do
    visit valid_categories_url
    click_on "Edit", match: :first

    click_on "Update Valid category"

    assert_text "Valid category was successfully updated"
    click_on "Back"
  end

  test "destroying a Valid category" do
    visit valid_categories_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Valid category was successfully destroyed"
  end
end
