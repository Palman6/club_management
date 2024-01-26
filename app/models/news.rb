# frozen_string_literal: true

# Model
class News < ApplicationRecord
  before_validation :set_default_image, on: :create
  has_one_attached :image

  belongs_to :creator, class_name: 'User'

  validates :title, presence: true
  validates :content, presence: true, length: { minimum: 15 }
  # validates_presence_of :image

  after_create :notify_user

  private

  def set_default_image
    return if self.image ||= 'default.jpg' unless image.attached?
  end

  def notify_user
    return unless persisted?

    Rails.logger.info 'Sending emails to all users'
    User.where.not(id: creator_id).find_each do |user|
      NewsMailer.new_news_email(user, self).deliver_now
    end
  end
end
