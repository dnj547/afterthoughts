class Afterthought < ApplicationRecord
  has_many :afterthought_attendees
  has_many :attendees, through: :afterthought_attendees
  belongs_to :event

  validates :actual_location, presence: true
  validates :actual_start, presence: true
  validates :actual_end, presence: true
  validates :rating, presence: true

end
