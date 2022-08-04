class Question < ApplicationRecord
  belongs_to :user
  belongs_to :author, class_name: 'User', optional: true

  has_many :question_hashtags, dependent: :destroy
  has_many :hashtags, through: :question_hashtags

  validates :body, presence: true, length: { maximum: 280 }

  after_save_commit :add_hashtags

  private

  def add_hashtags
    question_hashtags.destroy_all
    matched_tags = "#{body} #{answer}".downcase.scan(Hashtag::VALID_HASHTAG_REGEX)

    matched_tags.each do |matched_tag|
      self.hashtags << Hashtag.find_or_create_by!(name: matched_tag.gsub('#', ''))
    end
  end
end
