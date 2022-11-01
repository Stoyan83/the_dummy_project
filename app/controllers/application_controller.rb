class ApplicationController < ActionController::Base

  before_action :configure_permitted_parameters, if: :devise_controller?


  def current_user
    super || guest_user
  end

  private

  def guest_user
    begin
      User.find(session[:guest_user_id].nil? ? session[:guest_user_id] = create_guest_user.id : session[:guest_user_id])
    rescue
      session[:user_id] = nil
    end
  end

  def create_guest_user
    u = User.create(:username => "guest_#{Time.now.to_i}#{rand(99)}", :email => "guest_#{Time.now.to_i}#{rand(99)}@example.com", :guest => true)
    u.save(:validate => false)
    u
  end
  
  protected

  def configure_permitted_parameters    
    devise_parameter_sanitizer.permit :sign_up, keys: [:username, :email, :avatar]    
    devise_parameter_sanitizer.permit :account_update, keys: [:username, :email, :avatar]
  end
 
  def after_sign_in_path_for(resource)
    edit_user_registration_path
  end

  def after_sign_up_path_for(resource)
    edit_user_registration_path
  end
end