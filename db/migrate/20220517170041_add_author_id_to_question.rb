class AddAuthorIdToQuestion < ActiveRecord::Migration[7.0]
  def change
    add_column :questions, :author_id, :bigint
  end
end
