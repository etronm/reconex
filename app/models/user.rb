# == Schema Information
#
# Table name: users
#
#  id         :integer          not null, primary key
#  email      :string(255)
#  name       :string(255)
#  phone      :string(255)
#  password   :string(255)
#  user_type  :integer
#  created_at :datetime
#  updated_at :datetime
#

class User < ActiveRecord::Base
  before_save { self.email = email.downcase }

  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i

  validates :name, presence: true, length: { maximum: 50 }
  validates :email, presence: true, format: { with: VALID_EMAIL_REGEX } ,  uniqueness: { case_sensitive: false }
  validates :phone, presence: true, :phone_number => true
  validates :user_type, presence: true, numericality: { only_integer: true }, inclusion: 0..3

end
