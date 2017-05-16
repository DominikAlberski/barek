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
    assert_select 'li', text: 'Mohito'
    assert_select 'li', text: 'Pinacolada'
  end

  test "index shuld have link to main site" do
    get coctails_path
    assert_select 'a', text: 'Main site'
  end

  test 'shuld get show' do
    mohito = create(:coctail)
    get coctail_path(mohito)
    assert_response :success
  end

  test 'show shuld present 1 coctail' do
    pinacolada = create(:coctail)
    get coctail_path(pinacolada)
    assert_select 'p', text: 'sample_coctail'
  end
end
# 