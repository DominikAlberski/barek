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
end
# 