# == Schema Information
#
# Table name: users
#
#  id              :integer          not null, primary key
#  email           :string(255)
#  name            :string(255)
#  phone           :string(255)
#  password_digest :string(255)
#  user_type       :integer
#  created_at      :datetime
#  updated_at      :datetime
#

class User < ActiveRecord::Base
  has_many :articles, foreign_key: 'author_id', dependent: :destroy

  before_save { self.email = email.downcase }
  before_create :create_remember_token

  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i

  validates :name, presence: true, length: {maximum: 50}
  validates :email, presence: true, format: {with: VALID_EMAIL_REGEX}, uniqueness: {case_sensitive: false}
  validates :phone, :phone_number => {:ten_digits => true, :seven_digits => true, :allow_blank => true, :message => "Phone number must be either seven or digits in length, or blank."}
  validates :user_type, presence: true, numericality: {only_integer: true}, inclusion: 0..3

  has_secure_password
  validates :password, length: {minimum: 6}


  def User.new_remember_token
    SecureRandom.urlsafe_base64
  end

  def User.digest(token)
    Digest::SHA1.hexdigest(token.to_s)
  end

  def admin?
    self.user_type == 3
  end

  private

  def create_remember_token
    # Create the token.
    self.remember_token = User.digest(User.new_remember_token)
  end

end
