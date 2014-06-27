# == Schema Information
#
# Table name: article_contents
#
#  id            :integer          not null, primary key
#  article_id    :integer
#  section_id    :integer
#  description   :string(255)
#  status        :integer
#  display_order :integer
#  created_at    :datetime
#  updated_at    :datetime
#

class ArticleContent < ActiveRecord::Base
  belongs_to :article, class_name: 'Article'
  belongs_to :section, class_name: 'Section'
  attr_accessor :new_section_name

  validates :article, presence: true
  validates :section, presence: true

  validates :description, presence: true, length: {maximum: 3000}
  validates :status, presence: true, numericality: {only_integer: true}, inclusion: 0..1
  validates :display_order, presence: true, numericality: {only_integer: true}


end
