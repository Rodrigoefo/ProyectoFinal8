require 'test_helper'

class ContactmesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @contactme = contactmes(:one)
  end

  test "should get index" do
    get contactmes_url
    assert_response :success
  end

  test "should get new" do
    get new_contactme_url
    assert_response :success
  end

  test "should create contactme" do
    assert_difference('Contactme.count') do
      post contactmes_url, params: { contactme: { description: @contactme.description, email: @contactme.email, name: @contactme.name } }
    end

    assert_redirected_to contactme_url(Contactme.last)
  end

  test "should show contactme" do
    get contactme_url(@contactme)
    assert_response :success
  end

  test "should get edit" do
    get edit_contactme_url(@contactme)
    assert_response :success
  end

  test "should update contactme" do
    patch contactme_url(@contactme), params: { contactme: { description: @contactme.description, email: @contactme.email, name: @contactme.name } }
    assert_redirected_to contactme_url(@contactme)
  end

  test "should destroy contactme" do
    assert_difference('Contactme.count', -1) do
      delete contactme_url(@contactme)
    end

    assert_redirected_to contactmes_url
  end
end
