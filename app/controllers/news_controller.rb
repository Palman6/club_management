# frozen_string_literal: true

class NewsController < ApplicationController
  include Pundit::Authorization

  def index
    @news = ::News.all.order('created_at DESC')
  end

  def new
    @news = News.new
    authorize @news
  end

  def create
    @news = News.new(news_params.merge(creator_id: current_user.id))
    if @news.save
      flash.notice = 'News added successfully.'
      redirect_to(news_index_path)
    else
      render :new, status: :unprocessable_entity
    end
    authorize @news
  end

  def news_params
    params.require(:news).permit(:title, :content, :image)
  end
end
