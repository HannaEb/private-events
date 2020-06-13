class User < ApplicationRecord

  validates :name, presence: true, uniqueness: true
  validates :email, presence: true

  has_many :created_events, class_name: "Event", foreign_key: "creator_id"
  has_many :attendances, foreign_key: :attendee_id
  has_many :attended_events, through: :attendances

end
