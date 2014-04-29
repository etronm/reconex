class Article < ActiveRecord::Base

  validates :title, presence: true, length: {maximum: 60}, uniqueness: {case_sensitive: false}
  validates :description, presence: true, length: {maximum: 300}
  validates :status, presence: true, numericality: {only_integer: true}, inclusion: 0..1
  validates :author_id, presence: true
end
