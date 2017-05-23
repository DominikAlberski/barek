# require 'test_helper'

class AlcoholesControllerTest < ActionDispatch::IntegrationTest
#   test "should get index" do
#     get alcoholes_index_url
#     assert_response :success
#   end

#   test "should get show" do
#     get alcoholes_show_url
#     assert_response :success
#   end

#   test "should get new" do
#     get alcoholes_new_url
#     assert_response :success
#   end

#   test "should get create" do
#     get alcoholes_create_url
#     assert_response :success
#   end

#   test "should get edit" do
#     get alcoholes_edit_url
#     assert_response :success
#   end

#   test "should get update" do
#     get alcoholes_update_url
#     assert_response :success
#   end

  test "should delete destroy" do
    sample = create(:alcohol)
    delete alcohol_path(sample.id)
    assert_response :success
  end

end
