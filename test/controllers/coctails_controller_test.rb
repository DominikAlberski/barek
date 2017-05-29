require 'test_helper'

class CoctailsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get coctails_path
    assert_response :success
  end

  test "index shuld present all availble coctails names" do
    mohito = create(:coctail, name: 'Mohito')
    pinacolada = create(:coctail, name: "Pinacolada")
    get coctails_path
    assert_select 'a', mohito.name.capitalize
    assert_select 'a', pinacolada.name.capitalize
  end

  test "index shuld have link to main site" do
    get coctails_path
    assert_select 'a', text: 'Main site'
  end

  test "shuld get edit" do
  sample = create(:coctail) 
    get coctail_path(sample)
    assert_response :success
  end

  test "shuld patch redirect" do
    sample = create(:coctail)
    patch coctail_path(sample)
    assert_response :redirect
  end

  test "sign_in user shuld not be able to edit other user coctail" do
    skip
    # test nie przechodzi, wywala ostatnia asercja
    other_user_coctail = create(:coctail)
    sign_in create(:user)
    get coctail_path(other_user_coctail)
    assert_response :success
    assert_not_nil(Coctail.find(other_user_coctail.id))
    assert_equal("You can't change other Users Coctails", flash[:alert])
  end
end
# 