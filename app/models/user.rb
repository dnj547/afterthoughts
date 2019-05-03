class User < ApplicationRecord
  has_many :calendars
  has_many :events, through: :calendars
  has_many :afterthoughts, through: :calendars
  has_secure_password

  validates :username, uniqueness: true, length: {maximum: 30}

end
