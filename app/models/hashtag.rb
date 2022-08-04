class Hashtag < ApplicationRecord
  VALID_HASHTAG_REGEX = /#[[:word:]-]+/

  has_many :question_hashtags, dependent: :destroy
  has_many :questions, through: :question_hashtags

  default_scope { includes(:question_hashtags).where.not(question_hashtags: { question_id: nil}) }
end
