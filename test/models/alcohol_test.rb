require 'test_helper'

class AlcoholTest < ActiveSupport::TestCase
  test 'shuld_create_record' do
    create_user_alcohol_vodka
  end

  def create_user_alcohol_vodka 
    user = create(:user)
    vodka_test = create(:alcohol, user_id: user.id)
    bols = create(:vodka, alcohol_id: vodka_test.id)
  end
end
