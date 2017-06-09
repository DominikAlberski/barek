require 'test_helper'

#
class AlcoholesControllerTest < ActionDispatch::IntegrationTest
  test 'should get show response success' do
    sample = create(:alcohol)
    get alcohol_path(sample.id)
    assert_response :success
  end

  test 'should get show 1 alcohol' do
    sample = create(:alcohol)
    get alcohol_path(sample.id)
    assert_select '.name', sample.name
  end

  test 'should get new response success' do
    sign_in create(:user)
    get new_alcohol_path
    assert_response :success
  end

  test 'user shuld be able to create alcohol' do
    sign_in create(:user)
    alcohol = { alcohol: { name: 'sample 1', brand: 'sample brand', kind: 'wine' } }
    post alcohols_path alcohol
    assert_response :redirect
    assert_not_nil(Alcohol.find_by(name: 'sample 1', kind: 'wine'))
  end

  test 'user shuld be able to create alcohol(wine) with proper details' do
    sign_in create(:user)
    alcohol = { alcohol: { name: 'sample 1', brand: 'sample brand', kind: 'wine', wine_attributes: { kind: 'semi-dry', color: 'red' } } }
    post alcohols_path alcohol
    assert_response :redirect
    assert_not_nil((Alcohol.find_by name: 'sample 1', kind: 'wine').wine)
    assert_equal('semi-dry', Alcohol.find_by(name: 'sample 1', kind: 'wine').wine.kind)
  end

  test 'sign_in user shuld not be able to delete other user alcohol and set proper flash msg.' do
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
    assert_raises('ActiveRecord::RecordNotFound') { Alcohol.find(alcohol.id) }
    assert_equal("Successfully deleted alcohol #{alcohol.name}", flash[:notice])
  end

  test 'get edit shuld response success' do
    alcohol = create(:alcohol)
    sign_in alcohol.user
    get edit_alcohol_path(alcohol)
    assert_response :success
  end

  test 'Shuld get show have link to edit' do
    alcohol = create(:alcohol)
    sign_in alcohol.user
    get alcohol_path(alcohol)
    assert_select 'a', alcohol.name
  end

  test 'edit shuld show proper form with values' do
    alcohol = create(:alcohol)
    sign_in alcohol.user
    get edit_alcohol_path(alcohol)
    assert_select 'label', 'Name'
  end

  test 'sign_in user shuld not be able to edit other user alcohol and set proper flash msg.' do
    other_user_alcohol = create(:alcohol)
    sign_in create(:user)
    get edit_alcohol_path(other_user_alcohol)
    assert_response :redirect
    assert_equal("You can't change other Users Alcohols", flash[:alert])
  end

  test 'update shuld response redirect if success' do
    alcohol = create(:alcohol)
    alcohol_update = { alcohol: { name: 'sample_update 1' } }
    sign_in alcohol.user
    patch alcohol_path(alcohol, alcohol_update)
    assert_response :redirect
    assert_equal('Alcohol was updated', flash[:notice])
    assert_equal('sample_update 1', Alcohol.find(alcohol.id).name)
  end
end
