class User < ApplicationRecord
  include Gravtastic

  REGEXP_EMAIL = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/
  REGEXP_NIKNAME = /\A\w+\z/
  REGEXP_COLOR = /\A#([[:xdigit:]]{3}){1,2}\z/

  validates :email, presence: true, uniqueness: true, format: { with: REGEXP_EMAIL }
  validates :nickname, uniqueness: true, length: { maximum: 40 }, format: { with: REGEXP_NIKNAME }
  validates :color, format: { with: REGEXP_COLOR }, on: :update

  before_validation :downcase_nickname

  has_many :questions, dependent: :delete_all

  has_secure_password

  gravtastic(secure: true, filetype: :png, size: 100, default: 'retro')

  def downcase_nickname
    nickname&.downcase!
  end
end
