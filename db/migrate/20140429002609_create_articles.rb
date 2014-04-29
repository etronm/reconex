class CreateArticles < ActiveRecord::Migration
  def change
    create_table :articles do |t|
      t.string :title
      t.string :description
      t.integer :status
      t.integer :author_id
      t.date :date_published
      t.boolean :comments_enabled
      t.boolean :featured
      t.integer :views

      t.timestamps
    end
    add_index :articles, :title, unique: true
    add_index :articles, [:author_id, :date_published]
  end
end
