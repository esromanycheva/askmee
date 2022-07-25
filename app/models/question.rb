class Question < ApplicationRecord
  belongs_to :user
  belongs_to :author, class_name: 'User', optional: true

  has_many :question_hashtags, dependent: :destroy
  has_many :hashtags, through: :question_hashtags

  validates :body, presence: true, length: { maximum: 280 }
  after_save :add_hashtags

  private

  def add_hashtags
    matches = "#{body} #{answer}".downcase.scan(/#[[:word:]-]+/)
    tags = matches.map { |m| Hashtag.find_or_create_by!(name: m.gsub('#', '')) }
    question_hashtags.destroy_all
    hashtags << tags
  end
end
