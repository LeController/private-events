class Event < ApplicationRecord
  belongs_to :creator, foreign_key: "creator_id", class_name: "User"
  has_many :attendances, foreign_key: :attended_event_id
  has_many :attendees, :through => :attendances, source: :attendee

  scope :past, -> { where("date < ?", Date.today) }
  scope :future, -> { where("date > ?", Date.today) }

  validates :title, :location, :date, presence: true
end
