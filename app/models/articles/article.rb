# == Schema Information
#
# Table name: articles
#
#  id               :integer          not null, primary key
#  title            :string(255)
#  description      :string(255)
#  status           :integer
#  author_id        :integer
#  date_published   :date
#  comments_enabled :boolean
#  featured         :boolean
#  views            :integer
#  created_at       :datetime
#  updated_at       :datetime
#

class Article < ActiveRecord::Base
  belongs_to :user, class_name: 'User', foreign_key: 'author_id', validate: true
  has_many :article_contentses, :class_name => 'ArticleContents'
  has_many :article_photographs, :class_name => 'ArticlePhotos'
  has_many :sections, :class_name => 'Section', through: :article_contentses
  acts_as_taggable

  default_scope {order('created_at DESC')}

  validates :title, presence: true, length: {maximum: 60}, uniqueness: {case_sensitive: false, :message => I18n.t(:article_title_exist)}
  validates :description, presence: true, length: {maximum: 3000}
  validates :status, presence: true, numericality: {only_integer: true}, inclusion: 0..1
  validates :author_id, presence: true

end
