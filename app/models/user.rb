class User < ApplicationRecord
  has_secure_password

  REGEXP_EMAIL = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/
  REGEXP_NIKNAME = /\A[\w]+\z/

  before_save :downcase_nickname

  validates :email, presence: true, uniqueness: true, format: { with: REGEXP_EMAIL }
  validates :nickname, uniqueness: true, length: { maximum: 40 }, format: { with: REGEXP_NIKNAME }

  has_many :questions, dependent: :delete_all

  def downcase_nickname
    nickname.downcase!
  end
end
