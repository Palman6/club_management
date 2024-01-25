# frozen_string_literal: true

# Model
class News < ApplicationRecord
  has_one_attached :image

  belongs_to :creator, class_name: 'User'

  after_create :notify_user

  def notify_user
    return unless persisted?

    Rails.logger.info 'Sending emails to all users'
    User.where.not(id: creator_id).find_each do |user|
      NewsMailer.new_news_email(user, self).deliver_now
    end
  end
end
