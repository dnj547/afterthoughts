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

  ## custom validations
    def validates_start
      return if self.end.blank? || self.start.blank?
      if self.start > self.end
        errors.add(:end, "date/time must be after start date/time")
      end
    end

  ## methods for easier calendar functionality
    def start_time
      self.start
    end

  ## CLASS METHODS

  ## Events users have created in past 30 days
    def self.events_created_past_30_days
      Event.all.select do |event|
        event.created_at >= DateTime.now - 30.day
      end
    end

  ## How many events users have created in past 30 days
    def self.total_events_created_past_30_days
      Event.all.select do |event|
        event.created_at >= DateTime.now - 30.day
      end.length
    end

  ## All events in past 30 dayss
    def self.events_in_past_30_days
      Event.all.select do |event|
        event.start >= DateTime.now - 30.day
      end
    end

  ## Average rating of all events in past 30 days
    def self.average_rating_events_in_past_30_days
      Event.events_in_past_30_days.map do |event|
        if event.afterthought
          event.afterthought.rating
        end
      end
    end




end
