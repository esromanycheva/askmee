class Hashtag < ApplicationRecord
  VALID_HASHTAG_REGEX = /#[[:word:]-]+/

  has_many :question_hashtags, dependent: :destroy
  has_many :questions, through: :question_hashtags

  scope :unused, -> { includes(:question_hashtags).where(question_hashtags: { question_id: nil}) } 
end
