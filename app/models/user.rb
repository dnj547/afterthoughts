class User < ApplicationRecord
  has_many :calendars
  has_many :events, through: :calendars
end
