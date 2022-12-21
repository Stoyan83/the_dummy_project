class User < ApplicationRecord
  extend FriendlyId

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :pages, dependent: :destroy
  has_one_attached :avatar

  validate :validate_username, on: :create
  validates_uniqueness_of :username, :email

  validates :password, length: { minimum: 6, maximum: 20 }, on: :create
  validates :email, format: { with: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i, on: :create },
                    length: { maximum: 320 }
  validates :username, presence: true, length: { in: 3..40 },
                       format: { with: /\A[a-zA-Z0-9]+\z/, on: :create, message: "empty spaces not allowed" }

  friendly_id :username, use: %i[slugged finders history]

  scope :all_except, lambda {|user| where.not(id: user)}


  def validate_username
    errors.add(:username, :invalid) if User.where(username:).exists?
  end
end
