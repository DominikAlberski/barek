require 'test_helper'

class MainControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get root_path
    assert_response :success
  end

  test "link to Alcohols shuld be present" do
    get root_path
    assert_select 'a', text: 'Alcohols'
  end

  test "Link to Coctails shuld be present" do
    get root_path
    assert_select 'a', text: 'Coctails'
  end

end
