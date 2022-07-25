class Hashtag < ApplicationRecord
  VALID_HASHTAG_REGEX = /#[[:word:]-]+/

  validates_uniqueness_of :name
  has_many :question_hashtags, dependent: :destroy
  has_many :questions, through: :question_hashtags
end
