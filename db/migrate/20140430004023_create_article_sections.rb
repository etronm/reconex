class CreateArticleSections < ActiveRecord::Migration
  def change
    create_table :article_sections do |t|
      t.string :description
      t.int :status
      t.int :order

      t.timestamps
    end
    add_index :article_sections, :order
  end
end
