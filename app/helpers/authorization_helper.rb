module AuthorizationHelper 

  def current_user
    super || guest_user
  end

  def guest_user
    @cached_guest_user ||= User.find_by!(id: (cookies.permanent.signed[:guest_user_id] ||= create_guest_user.id))

    rescue ActiveRecord::RecordNotFound #
      cookies.delete :guest_user_id
      guest_user
  end
  
  def create_guest_user
    u = User.create(:username => "guest_#{SecureRandom.hex(13)}", :email => "guest_#{SecureRandom.hex(13)}@example.com", :guest => true)
    u.save(:validate => false)
    u
  end
end