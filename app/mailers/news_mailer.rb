# frozen_string_literal: true

class NewsMailer < ApplicationMailer
  def new_news_email(user, news)
    @user = user
    @news = news
    
    mail(
      to: @user.email,
      subject: "New news on #{@news.title}"
    )
  end
end
