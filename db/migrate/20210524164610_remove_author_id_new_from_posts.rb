class RemoveAuthorIdNewFromPosts < ActiveRecord::Migration[6.1]
  def change
    remove_column :posts, :author_id_new, :integer
  end
end
