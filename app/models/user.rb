class User < ApplicationRecord
  validates_presence_of :username, :password
  has_secure_password
  has_many :calendars
  has_many :events, through: :calendars
  has_many :afterthoughts, through: :calendars
end
