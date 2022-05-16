class User < ApplicationRecord
  has_secure_password

  REGEXP_EMAIL = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/
  REGEXP_NIKNAME = /\A[\w]+\z/
  REGEXP_COLOR = /\A#(?:[0-9a-fA-F]{3}){1,2}\z/

  before_save :downcase_nickname

  validates :email, presence: true, uniqueness: true, format: { with: REGEXP_EMAIL }
  validates :nickname, uniqueness: true, length: { maximum: 40 }, format: { with: REGEXP_NIKNAME }
  validates :color, format: { with: REGEXP_COLOR }

  has_many :questions, dependent: :delete_all

  def downcase_nickname
    nickname.downcase!
  end
end
