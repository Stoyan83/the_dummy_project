module AuthorizationHelper

  def current_or_guest_user
    if current_user
      if cookies.signed[:guest_user_id]    
        guest_user.delete
        cookies.delete :guest_user_id
      end
      current_user
    else
      guest_user
    end
  end

  def guest_user
    @cached_guest_user ||= User.find_by!(id: (cookies.permanent.signed[:guest_user_id] ||= create_guest_user.id))

    rescue ActiveRecord::RecordNotFound #
      cookies.delete :guest_user_id
      guest_user
  end
  
  def create_guest_user
    u = User.create(:username => "guest_#{Time.now.to_i}#{rand(99)}", :email => "guest_#{Time.now.to_i}#{rand(99)}@example.com", :guest => true)
    u.save(:validate => false)
    u
  end
end