# frozen_string_literal: true

class Ability
  include CanCan::Ability

  def initialize(user)
    user ||= User.new
    can :manage, Page, user_id: user.id
    can :show, Page
  end
end
