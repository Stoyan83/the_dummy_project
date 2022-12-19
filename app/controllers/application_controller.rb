class ApplicationController < ActionController::Base
  include AuthorizationHelper

  before_action :configure_permitted_parameters, if: :devise_controller?
  before_action :set_query


  def set_query
    @query = Page.ransack(params[:q])
  end


  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit :sign_up, keys: %i[username email avatar]
    devise_parameter_sanitizer.permit :account_update, keys: %i[username email avatar]
  end

  def after_sign_in_path_for(_resource)
    edit_user_registration_path
  end

  def after_sign_up_path_for(_resource)
    edit_user_registration_path
  end
end
