class Event < ApplicationRecord
  belongs_to :calendar
  has_one :afterthought
  has_many :event_attendees
  has_many :attendees, through: :event_attendees

  
  validates :organizer, presence: true, length: {maximum: 30}
  validates :title, presence: true, length: {maximum: 30}
  # validates :description, presence: true
  validates :start, presence: true
  validates :end, presence: true
  # validates :location, presence: true, length: {maximum: 30}
  validate :validates_start

  def validates_start
    if self.start > self.end
      errors.add(:start, "must be before end time")
    end
  end





end
