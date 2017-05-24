require 'test_helper'


class AlcoholesControllerTest < ActionDispatch::IntegrationTest
#   test "should get index" do
#     get alcoholes_index_url
#     assert_response :success
#   end

  test "should get show response success" do
    sample = create(:alcohol)
    get alcohol_path(sample.id)
    assert_response :success
  end

  test "should get show 1 alcohol" do
    sample = create(:alcohol)
    get alcohol_path(sample.id)
    assert_select 'p', sample.name
  end

  test "should get new response success" do
    sign_in create(:user)
    get new_alcohol_path
    assert_response :success
  end

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

  test "sign_in user shuld not be able to delete other user alcohol and set proper flash msg." do
    other_user_alcohol = create(:alcohol)
    sign_in create(:user)
    delete alcohol_path(other_user_alcohol.id)
    assert_response :redirect
    assert_not_nil(Alcohol.find(other_user_alcohol.id))
    assert_equal("You can't change other Users Alcohols", flash[:alert])
  end

  test 'sign_in user shuld be able to delete assign alcohol' do
    alcohol = create(:alcohol)
    sign_in alcohol.user
    delete alcohol_path(alcohol.id)
    assert_response :redirect
    assert_raises( "ActiveRecord::RecordNotFound" ) { Alcohol.find(alcohol.id) }
    assert_equal("Successfully deleted alcohol #{alcohol.name}", flash[:notice])
  end


end
