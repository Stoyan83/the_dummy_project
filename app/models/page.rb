class Page < ApplicationRecord
  extend FriendlyId

  PAGE_LIMIT = 1

  friendly_id :slug_candidates, use: %i[slugged finders history]
  belongs_to :user
  has_one_attached :avatar

  validate on: :create do
    errors.add(:user, message: "have too many pages", type: "danger") if user.guest? && user.pages.length > PAGE_LIMIT
  end

  validates :first_name, :last_name, :about, :page_type, presence: true

  def slug_candidates
    [
      user.username,
      [user.username, :first_name],
      [user.username, :first_name, :last_name]
    ]
  end

  def should_generate_new_friendly_id?
    first_name_changed? || slug.blank?
  end
end
