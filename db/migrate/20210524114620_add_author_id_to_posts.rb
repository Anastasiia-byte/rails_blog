class AddAuthorIdToPosts < ActiveRecord::Migration[6.1]
  def change
    add_column :posts, :author_id_new, :integer
    add_index :posts, :author_id_new
  end
end
