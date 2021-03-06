class CreateArticleContents < ActiveRecord::Migration
  def change
    create_table :article_contents do |t|
      t.integer :article_id
      t.integer :section_id
      t.string  :description
      t.integer :status
      t.integer :display_order

      t.timestamps
    end
    add_index :article_contents, :display_order
  end
end
