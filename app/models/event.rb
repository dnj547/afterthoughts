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

    def end_time
      self.end
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


  ## Events with ratings in past 30 days
    def self.events_with_ratings_in_past_30_days
      Event.events_in_past_30_days.select do |event|
        event.afterthought
      end

    end

  ## Ratings of all events in past 30 days
    def self.rating_of_all_events_in_past_30_days
      Event.events_with_ratings_in_past_30_days.map do |event|
          event.afterthought.rating
      end
    end

  ## Average rating of all events in past 30 days
    def self.average_rating_events_in_past_30_days
      if Event.rating_of_all_events_in_past_30_days != []
        total = 0
        Event.rating_of_all_events_in_past_30_days.each do |rating|
          total += rating
        end

        total / (Event.rating_of_all_events_in_past_30_days.length)
      else
        "There are no Events with Ratings"
      end
    end


    ## Instance Methods


end
