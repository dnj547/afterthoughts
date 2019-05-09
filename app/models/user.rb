class User < ApplicationRecord
  validates_presence_of :username, :password
  validates :username, uniqueness: true, length: {minimum: 4}
  validates :password, length: {minimum: 6}
  has_secure_password
  has_many :calendars
  has_many :events, through: :calendars
  has_many :afterthoughts, through: :calendars

  ## CLASS METHODS

  ## Users that have signed up in the past 30 days

    def self.users_signed_up_past_30_day
      User.all.select do |user|
        user.created_at >= DateTime.now - 30.day
      end
    end

  ## How many users have signed up in the past 30 days
    def self.total_users_signed_up_past_30_day
      User.all.select do |user|
        user.created_at >= DateTime.now - 30.day
      end.length
    end

  ## INSTANCE METHODS

  ## How many events I have in my calendars
    def number_of_events_in_my_calendars
      self.events.length
    end

  ## How many events I have in a specific calendar
    def number_of_events_in_calendar(calendar_name)
      self.calendars.select do |calendar|
        calendar.name == calendar_name
      end.length
    end

  ## How many afterthoughts I’ve written
    def afterthoughts_count
      self.afterthoughts.length
    end

  ## afterthoughts by rating
    def afterthoughts_by_rating
      self.afterthoughts.sort_by do |afterthought|
        afterthought.rating
      end.reverse
    end

  ## top 3 rated afterthoughts
    def top_three_rated_afterthoughts
      self.afterthoughts_by_rating.first(3)
    end

  ## my highest rated events
    def highest_events_by_rating
      self.afterthoughts_by_rating.map do |afterthought|
        afterthought.event
      end
    end

  ## top 3 events by rating
    def top_three_rated_events
      self.highest_events_by_rating.first(3)
    end

  ## My lowest rated events
    def lowest_events_by_rating
      self.afterthoughts_by_rating.map do |afterthought|
        afterthought.event
      end.reverse
    end

  ## bottom 3 events by rating
    def bottom_three_rated_events
      self.lowest_events_by_rating.first(3)
    end

  ## Event with the most attendees (and how many there were)
    def event_most_attendees
      self.events.max_by do |event|
        event.attendees.length
      end
    end

  ## Number of attendees at event with most attendees
    def event_most_attendees_count
      self.event_most_attendees.attendees.count
    end

  ## Afterthoughts with the most words in the description
    def afterthought_most_words
      self.afterthoughts.max_by do |afterthought|
        afterthought.thoughts.length
      end
    end

  ## All words in my afterthoughts
    def words_in_afterthoughts
      self.afterthoughts.map do |afterthought|
        afterthought.thoughts
      end.join(" ").split.to_a
    end

  ## Most common word in my afterthoughts
    def most_common_word_in_afterthoughts
      arr = self.words_in_afterthoughts

      counts= arr.uniq.map { |x| [x, arr.count(x)] }.to_h

      most_common = counts.max_by do |word,count|
        count
      end

      most_common[0]

    end

    ## My events in past 30 days
      def my_events_in_past_30_days
        self.events.select do |event|
          event.start >= DateTime.now - 30.day
        end
      end

    ## My events with ratings in past 30 days
      def my_events_with_ratings_in_past_30_days
        self.my_events_in_past_30_days.select do |event|
          event.afterthought
        end

      end

    ## Ratings of all my events in past 30 days
      def my_rating_of_all_events_in_past_30_days
        self.my_events_with_ratings_in_past_30_days.map do |event|
            event.afterthought.rating
        end
      end
    ## Average rating of all events in past 30 days
      def my_average_rating_events_in_past_30_days
        total = 0
        self.my_rating_of_all_events_in_past_30_days.each do |rating|
          total += rating
        end
        total / (self.my_rating_of_all_events_in_past_30_days.length)
      end





end
