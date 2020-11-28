class ApplicationController < ActionController::Base
  before_action :authenticate_user!, except: [:index, :myself, :new_guest]
  before_action :configure_permitted_parameters, if: :devise_controller?

  protected

  def configure_permitted_parameters
    #ユーザー新規登録時のストロングパラメーター
    devise_parameter_sanitizer.permit(:sign_up, keys: [:username])
    #ユーザー編集時のストロングパラメーター
    devise_parameter_sanitizer.permit(:account_update, keys: [:image, :profile])
  end
end
