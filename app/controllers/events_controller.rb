# frozen_string_literal: true

# This controller provides the overall control on events
class EventsController < ApplicationController
  include Pundit::Authorization

  def index
    all_events
    authorize @events
  end

  def show
    all_events
    event_by_id
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
      redirect_to @event, notice: 'Event created successfully.'
    else
      render :new, status: :unprocessable_entity
    end
    authorize @event
  end

  def edit
    event_by_id
    authorize @event
  end

  def update
    event_by_id
    if @event.update(event_params.merge(creator_id: current_user.id))
      redirect_to @event, notice: 'Event updated successfully.'
    else
      render :edit, status: :unprocessable_entity
    end
    authorize @event
  end

  def destroy
    event_by_id
    @event.destroy
    flash.notice = 'Event was deleted.'
    redirect_to(@event)
    authorize @event
  end

  def my_event
    @created_event = current_user.attended_events.all
  end

  def past
    all_events
  end

  def upcoming
    all_events
  end

  def current
    all_events
  end

  def all_events
    @events = Event.all
  end

  def event_by_id
    @event = Event.find(params[:id])
  end

  def event_params
    params.require(:event).permit(:name, :description, :location, :date, :image)
  end
end
