class Attendee < ApplicationRecord
  has_many :event_attendees
  has_many :afterthought_attendees
  has_many :events, through: :event_attendees
  has_many :afterthoughts, through: :afterthought_attendees
end
