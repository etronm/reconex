class Session  < ActiveRecord::Base
  has_no_table

  column :name, :string
  column :email, :string

  validates_presence_of :name
  validates_presence_of :email

  def no_match
    errors.add(:email, '/password incorrectos')
  end

end