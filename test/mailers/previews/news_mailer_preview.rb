# frozen_string_literal: true

# Preview all emails at http://localhost:3000/rails/mailers/news_mailer
class NewsMailerPreview < ActionMailer::Preview
  # Preview this email at http://localhost:3000/rails/mailers/news_mailer/new_news_email
  def new_news_email
    NewsMailer.new_news_email
  end
end
