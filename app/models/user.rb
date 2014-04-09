# == Schema Information
#
# Table name: users
#
#  id         :integer          not null, primary key
#  userid     :string(255)
#  name       :string(255)
#  email      :string(255)
#  phone      :string(255)
#  password   :string(255)
#  cpassword  :string(255)
#  created_at :datetime
#  updated_at :datetime
#

class User < ActiveRecord::Base
  before_save { self.email = email.downcase }

  validates :userid, presence: true,length: { maximum: 20 }
  validates :name, presence: true, length: { maximum: 50 }

  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, presence: true, format: { with: VALID_EMAIL_REGEX } ,  uniqueness: { case_sensitive: false }

  validates :phone, presence: true

end
