require 'test_helper'

class CoctailsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get coctails_path
    assert_response :success
  end

  test 'index shuld present all availble coctails names' do
    mohito = create(:coctail, name: 'Mohito')
    pinacolada = create(:coctail, name: 'Pinacolada')
    get coctails_path
    assert_select 'a', mohito.name.capitalize
    assert_select 'a', pinacolada.name.capitalize
  end

  test 'index shuld have link to main site' do
    get coctails_path
    assert_select 'a', text: 'Main site'
  end

  test 'get edit shuld response success' do
    coctail = create(:coctail)
    sign_in coctail.user
    get edit_coctail_path(coctail)
    assert_response :success
  end

  test 'get show shuld have edit link' do
    coctail = create(:coctail)
    sign_in coctail.user
    get coctail_path(coctail)
    assert_select 'a', coctail.name.capitalize
  end
end
