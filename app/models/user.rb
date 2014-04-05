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
end
