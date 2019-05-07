class User < ApplicationRecord
  validates_presence_of :username, :password
  validates :username, uniqueness: true, length: {minimum: 4}
  validates :password, length: {minimum: 6}
  has_secure_password
  has_many :calendars
  has_many :events, through: :calendars
  has_many :afterthoughts, through: :calendars
end
