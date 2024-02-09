# frozen_string_literal: true

# This controller provides the overall control on events
class EventsController < ApplicationController
  include Pundit::Authorization

  def index
    events
    authorize @events
  end

  def show
    events
    event
    authorize @event
  end

  def new
    @event = Event.new
    authorize @event
  end

  def create
    @event = Event.new(event_params)
    @event.creator = current_user if current_user.admin?
    if @event.save
      redirect_to(@event)
      flash[:notice] = t('.flash.notice')
    else
      flash[:alert] = error_messages_for(@event)
      render :new, status: :unprocessable_entity
    end
    authorize @event
  end

  def edit
    event
    authorize @event
  end

  def update
    event
    if @event.update(event_params.merge(creator_id: current_user.id))
      redirect_to(@event)
      flash[:notice] = t('.flash.notice')
    else
      flash[:alert] = error_messages_for(@event)
      render :edit, status: :unprocessable_entity
    end
    authorize @event
  end

  def destroy
    event
    @event.destroy
    flash[:notice] = t('.flash.notice')
    redirect_to '/my_event'
    authorize @event
  end

  def my_event
    @created_event = current_user.attended_events.all
  end

  def past
    events
  end

  def upcoming
    events
  end

  def current
    events
  end

  def events
    @events = Event.all
  end

  def event
    @event = Event.find(params[:id])
  end

  def event_params
    params.require(:event).permit(:name, :description, :location, :date, :image)
  end

  private

  def error_messages_for(event)
    event.errors.full_messages.uniq.map { |msg| t("errors.messages.#{msg.downcase}", default: msg) }.join(', ')
  end
end
