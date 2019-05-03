class Event < ApplicationRecord
  belongs_to :calendar
  has_many :event_attendees
  has_many :attendees, through: :event_attendees
end
