require 'test_helper'

class VodkasControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get vodkas_new_url
    assert_response :success
  end

  test "should get edit" do
    get vodkas_edit_url
    assert_response :success
  end

  test "should get update" do
    get vodkas_update_url
    assert_response :success
  end

  test "should get create" do
    get vodkas_create_url
    assert_response :success
  end

end
