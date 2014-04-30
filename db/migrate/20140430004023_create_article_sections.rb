class CreateArticleSections < ActiveRecord::Migration
  def change
    create_table :article_sections do |t|
      t.string  :description
      t.integer :status
      t.integer :display_order

      t.timestamps
    end
    add_index :article_sections, :display_order
  end
end
