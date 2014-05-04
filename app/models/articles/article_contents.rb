class ArticleContents < ActiveRecord::Base
  belongs_to :article
  belongs_to :section

  validates :description, presence: true, length: {maximum: 3000}
  validates :status, presence: true, numericality: {only_integer: true}, inclusion: 0..1
  validates :display_order, presence: true, numericality: {only_integer: true}


end
