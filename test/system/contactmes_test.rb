require "application_system_test_case"

class ContactmesTest < ApplicationSystemTestCase
  setup do
    @contactme = contactmes(:one)
  end

  test "visiting the index" do
    visit contactmes_url
    assert_selector "h1", text: "Contactmes"
  end

  test "creating a Contactme" do
    visit contactmes_url
    click_on "New Contactme"

    fill_in "Description", with: @contactme.description
    fill_in "Email", with: @contactme.email
    fill_in "Name", with: @contactme.name
    click_on "Create Contactme"

    assert_text "Contactme was successfully created"
    click_on "Back"
  end

  test "updating a Contactme" do
    visit contactmes_url
    click_on "Edit", match: :first

    fill_in "Description", with: @contactme.description
    fill_in "Email", with: @contactme.email
    fill_in "Name", with: @contactme.name
    click_on "Update Contactme"

    assert_text "Contactme was successfully updated"
    click_on "Back"
  end

  test "destroying a Contactme" do
    visit contactmes_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Contactme was successfully destroyed"
  end
end
