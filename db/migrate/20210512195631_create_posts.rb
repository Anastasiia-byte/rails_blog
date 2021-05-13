class CreatePosts < ActiveRecord::Migration[6.1]
  def change
    create_table :posts do |t|
      t.string :title
      t.text :description
      t.datetime :publish_date
      t.references :author, null: false, foreign_key: true

      t.timestamps
    end
  end
end
