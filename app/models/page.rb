class Page < ApplicationRecord
  extend FriendlyId 

  PAGE_LIMIT = 1

  belongs_to :user
  friendly_id :slug_candidates, use: %i[slugged finders history]


  validate on: :create do
    if user.guest? && user.pages.length > PAGE_LIMIT 
    errors.add(:user, message: "have too many pages", type: 'danger')
    end
  end

  validates :first_name, :last_name, :about, presence: true

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
