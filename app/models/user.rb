class User < ActiveRecord::Base
  has_no_table

  column :userid, :string
  column :name, :string
  column :email, :string
  column :phone, :string
  column :password, :string
  column :cpassword, :string

  validates_presence_of :name
  validates_presence_of :email
  validates_presence_of :phone
  validates_format_of :email,
                      :with => /\A[-a-z0-9_+\.]+\@([-a-z0-9]+\.)+[a-z0-9]{2,4}\z/i
  validates_length_of :phone, :maximum => 30

end
