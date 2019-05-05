class User < ApplicationRecord
  has_secure_password
  has_many :calendars
  has_many :events, through: :calendars

end
