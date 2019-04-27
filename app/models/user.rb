# user class
class User < ApplicationRecord
  has_secure_password
  has_secure_token
  # has_secure_token :auth_token

  validates :name, presence: true, uniqueness: true
  validates :email, presence: true, uniqueness: true
  # validates :password, presence: true
  validates :group, presence: true

  belongs_to :group

  def invalidate_token
    update_columns(token: nil)
  end

  def self.valid_login?(email, password)
    return unless email && password
    user = User.find_by(email: email)
    return unless user&.authenticate(password)

    user
  end
end
