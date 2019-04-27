# group class
class Group < ApplicationRecord
  has_many :users, dependent: :destroy
  validates :access_level, presence: true, uniqueness: true
  validates :name, presence: true, uniqueness: true, inclusion: {in: %w[
    user
    admin
  ]
  }

  def self.user
    Group.find_by_name 'user'
  end

  def self.admin
    Group.find_by_name 'admin'
  end
end
