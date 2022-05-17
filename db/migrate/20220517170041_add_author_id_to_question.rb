class AddAuthorIdToQuestion < ActiveRecord::Migration[7.0]
  def change
    add_column :questions, :author_id, :bigint

    Question.all.each do |question|
      question.update(author_id: question.user_id)
    end
  end
end
