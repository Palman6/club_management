# frozen_string_literal: true

# Model
class Event < ApplicationRecord
  scope :past_events, -> { where('date < ?', Time.zone.now) }
  scope :upcoming_events, -> { where('date > ?', DateTime.now) }
  scope :current_events, -> { where('date = ?', DateTime.now) }

  has_one_attached :image
  belongs_to :creator, class_name: 'User'
  has_many :attendings, foreign_key: :attended_event_id, dependent: :destroy, inverse_of: :attended_event
  has_many :attendees, through: :attendings, dependent: :destroy

  validates :name, :location, :date, presence: true
  validates :description, presence: true, length: { minimum: 15 }
  validates_comparison_of :date, greater_than_or_equal_to: DateTime.now
  # validates_presence_of :image
  validates :creator_id, presence: true

  after_update :notify_user

  def notify_user
    return unless persisted?

    Rails.logger.info 'Sending emails to all prticipants'
    participants = attendees.reject { |user| user.id == creator_id }
    participants.each do |user|
      EventsMailer.event_update_email(user, self).deliver_later
    end
  end
end
