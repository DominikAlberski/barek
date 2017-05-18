class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :configure_permitted_parameters, if: :devise_controller?

  def authorize_access?(coctail)
    # if current_user.id != coctail.user.id
    #   redirect_to coctail_path(coctail) and return false flash[:alert] = "You can't change other Users Coctails"
    # end
    flash[:alert] = "You can't change other Users Coctails"
    current_user.id == coctail.user.id
  end

  protected

  def configure_permitted_parameters
    added_attrs = [:username, :email, :password, :password_confirmation, :remember_me]
    devise_parameter_sanitizer.permit :sign_up, keys: added_attrs
    devise_parameter_sanitizer.permit :account_update, keys: added_attrs
  end
end
