require 'test_helper'

class CoctailTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
  # def create_user_coctail 
  #   @user = create(:user)
  #   coctail_test = create(:coctail, user_id: @user.id)
  # end

  def create_user_alcohol_vodka 
    vodka_test = create(:alcohol, user_id: @user.id)
    bols = create(:vodka, alcohol_id: vodka_test.id)
  end

  test 'shuld create new coctail' do
    mohito = create(:coctail)
    assert_equal(mohito, Coctail.first)
  end

  test 'shuld add other_ingredient to coctail' do
    coctail = create(:coctail)
    sok = OtherIngredient.new(name: 'sok')
    sok.save!
    coctail.other_ingredients << sok
    assert_equal(sok, coctail.other_ingredients.first)
    # pp coctail.reload.other_ingredients
  end
end
