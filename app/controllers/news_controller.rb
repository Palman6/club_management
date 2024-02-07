# frozen_string_literal: true

# This controller provides the overall control on News
class NewsController < ApplicationController
  include Pundit::Authorization

  def index
    @pagy, @news = pagy(::News.all.order('created_at DESC'), items: 10)
  end

  def new
    @news = News.new
    authorize @news
  end

  def create
    @news = News.new(news_params.merge(creator_id: current_user.id))
    if @news.save
      redirect_to(news_index_path)
      flash[:notice] = t('.flash.notice')
    else
      flash[:alert] = error_messages_for(@news)
      render :new, status: :unprocessable_entity
    end
    authorize @news
  end

  def news_params
    params.require(:news).permit(:title, :content, :image)
  end

  def error_messages_for(news)
    news.errors.full_messages.uniq.map { |msg| t("errors.messages.#{msg.downcase}", default: msg) }.join(', ')
  end
end
