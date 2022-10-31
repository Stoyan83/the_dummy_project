class Page < ApplicationRecord
  extend FriendlyId

  belongs_to :user
  friendly_id :slug_candidates, use: %i[slugged finders history]

  def slug_candidates  

    [
      user.username,
      [user.username, :first_name],
      [user.username, :first_name, :last_name],
    ]
  end

  def should_generate_new_friendly_id?
    first_name_changed? || slug.blank?
  end
end
