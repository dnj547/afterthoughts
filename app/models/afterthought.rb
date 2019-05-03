class Afterthought < ApplicationRecord
  has_many :afterthought_attendees
  has_many :attendees, through: :afterthought_attendees
  belongs_to :event
end
