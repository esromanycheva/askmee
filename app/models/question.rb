class Question < ApplicationRecord
  belongs_to :user
  belongs_to :author, class_name: 'User', optional: true

  has_many :question_hashtags, dependent: :destroy
  has_many :hashtags, through: :question_hashtags

  validates :body, presence: true, length: { maximum: 280 }
  before_save :add_hashtags

  private

  def add_hashtags
    matches = "#{body} #{answer}".to_s.downcase.scan(/#[[:word:]-]+/).flatten
    tags = matches.map { |m| Hashtag.find_or_create_by!(name: m.gsub('#', '')) }
    hashtags << tags.uniq
  end
end
