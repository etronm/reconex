# == Schema Information
#
# Table name: sections
#
#  id          :integer          not null, primary key
#  name        :string(255)
#  description :string(255)
#  status      :integer
#  created_at  :datetime
#  updated_at  :datetime
#

class Section < ActiveRecord::Base
  has_many :article_contentses, :class_name => 'ArticleContents'
  has_many :articles, through: :article_contentses

  has_many :article_photographs, :class_name => 'ArticlePhotos'
  has_many :articles, through: :article_photographs

  scope :active, -> { where(status: 0) }

  validates :name, presence: true, length: {maximum: 30}, uniqueness: {case_sensitive: false}
  validates :description, presence: true, length: {maximum: 60}
  validates :status, presence: true, numericality: {only_integer: true}, inclusion: 0..1

  def self.search(query)
    where("upper(name) like upper(?)", "%#{query}%")
  end

end
