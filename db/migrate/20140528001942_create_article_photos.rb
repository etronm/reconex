class CreateArticlePhotos < ActiveRecord::Migration
  def change
    create_table :article_photos do |t|
      t.integer :article_id
      t.integer :section_id
      t.string :photo_path
      t.string :album_url
      t.string :photo_content

      t.timestamps
    end
  end
end
