# group class
class Group < ApplicationRecord
  has_many :users
  validates :name, presence: true, uniqueness: true
  validates :access_level, presence: true, uniqueness: true, inclusion: {in: %w[
    guest
    customer
    employee
    admin
    owner
  ]
  }

  def self.guest
    Group.find_by_name 'guest'
  end

  def self.customer
    Group.find_by_name 'customer'
  end

  def self.employee
    Group.find_by_name 'employee'
  end

  def self.admin
    Group.find_by_name 'admin'
  end

  def self.owner
    Group.find_by_name 'owner'
  end
end
