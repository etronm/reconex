class Section < ActiveRecord::Base
  has_many :articles, through: :articles_contents

  validates :name, presence: true, length: {maximum: 30}, uniqueness: {case_sensitive: false}
  validates :description, presence: true, length: {maximum: 60}
  validates :status, presence: true, numericality: {only_integer: true}, inclusion: 0..1

end
