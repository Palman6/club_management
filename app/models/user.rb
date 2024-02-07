# frozen_string_literal: true

# Model
class User < ApplicationRecord
  include Devise::JWT::RevocationStrategies::JTIMatcher
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :invitable, :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable,
         :jwt_authenticatable, jwt_revocation_strategy: self

  enum role: { admin: 0, member: 1 }
  enum gender: { male: 0, female: 1 }

  has_many :events, class_name: 'Event', foreign_key: 'creator_id', dependent: :destroy, inverse_of: :creator
  has_many :attendings, foreign_key: :attendee_id, dependent: :destroy, inverse_of: :attendee
  has_many :attended_events, through: :attendings, dependent: :destroy

  after_create :registration_notification

  def registration_notification
    return unless persisted?

    Rails.logger.info 'Sending emails to registered user'
    UsersMailer.registration_email(self).deliver_later
  end
end
