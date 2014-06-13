# == Schema Information
#
# Table name: article_photos
#
#  id            :integer          not null, primary key
#  article_id    :integer
#  section_id    :integer
#  photo_path    :string(255)
#  album_url     :string(255)
#  photo_content :string(255)
#  created_at    :datetime
#  updated_at    :datetime
#

class ArticlePhotos < ActiveRecord::Base
  belongs_to :article, class_name: 'Article'
  belongs_to :section, class_name: 'Section'
  mount_uploader :photo_path, ImageUploader

  validates :article, presence: true
  validates :section, presence: true

  # validates :photo_content, presence: true, allow_nil: false
  #validates :photo_path, presence: true, allow_nil: false
  # validates :album_url, presence: true, allow_nil: false

  validate :has_one_photo_type

  private

  def has_one_photo_type
    if (photo_content == '' && album_url == '')
      errors.add(:base, "Should have one photo type")
    end
  end
end
