class ArticleContents < ActiveRecord::Base
  belongs_to :article, class_name: 'Article'
  belongs_to :section, class_name: 'Section'

  validates :article, presence: true
  validates :section, presence: true

  validates :description, presence: true, length: {maximum: 3000}
  validates :status, presence: true, numericality: {only_integer: true}, inclusion: 0..1
  validates :display_order, presence: true, numericality: {only_integer: true}


end
