class Afterthought < ApplicationRecord
  has_many :afterthought_attendees
  has_many :attendees, through: :afterthought_attendees
  belongs_to :event

  validates :actual_location, presence: true
  validates :actual_start, presence: true
  validates :actual_end, presence: true
  validates :rating, presence: true


  ## CLASS METHODS

  ## Afterthoughts created in past 30 days
    def self.afterthoughts_created_in_past_30_days
      Afterthought.all.select do |afterthought|
        afterthought.created_at >= DateTime.now - 30.day
      end
    end

  ## How many afterthoughts created in past 30 days
    def self.total_afterthoughts_created_in_past_30_days
      Afterthought.all.select do |afterthought|
        afterthought.created_at >= DateTime.now - 30.day
      end.length
    end




end
