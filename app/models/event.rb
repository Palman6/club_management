# frozen_string_literal: true

class Event < ApplicationRecord
  scope :past_events, -> { where('date < ?', Time.zone.now) }
  scope :upcoming_events, -> { where('date > ?', DateTime.now) }
  scope :current_events, -> { where('date = ?', DateTime.now) }

  has_one_attached :image

  belongs_to :creator, class_name: 'User'

  has_many :attendings, foreign_key: :attended_event_id, dependent: :destroy
  has_many :attendees, through: :attendings, dependent: :destroy

  after_update :notify_user

  def notify_user
    if persisted?
        puts 'Sending emails to all prticipants'
        participants = self.attendees.reject { |user| user.id == creator_id }
        participants.each do |user|
          EventsMailer.event_update_email(user, self).deliver_now
        end
    end
  end
end
