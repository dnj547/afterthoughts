class Event < ApplicationRecord
  belongs_to :calendar
  has_one :afterthought
  has_many :event_attendees
  has_many :attendees, through: :event_attendees
  accepts_nested_attributes_for :attendees, allow_destroy: true


  validates :organizer, presence: true, length: {maximum: 30}
  validates :title, presence: true, length: {maximum: 30}
  validates :start, presence: true
  validates :end, presence: true
  validate :validates_start

  def validates_start
    return if self.end.blank? || self.start.blank?
    if self.start > self.end
      errors.add(:end, "date/time must be after start date/time")
    end
  end


  ##methods for easier calendar functionality
  def start_time
    self.start
  end




end
