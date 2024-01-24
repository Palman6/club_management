# frozen_string_literal: true

class News < ApplicationRecord
#   include NewsNotifier

  has_one_attached :image

  belongs_to :creator, class_name: 'User', foreign_key: :creator_id

  after_create :notify_user


  def notify_user
    if persisted?
        puts 'Sending emails to all users'
        User.where.not(id: creator_id).each do |user|
            NewsMailer.new_news_email(user, self).deliver_now
        end
    end
  end
end
