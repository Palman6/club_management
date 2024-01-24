# frozen_string_literal: true

class EventsController < ApplicationController
  include Pundit::Authorization

  def index
    get_all_event
    authorize @events
  end

  def show
    get_all_event
    get_event_by_id
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
    get_event_by_id
    authorize @event
  end

  def update
    get_event_by_id
    if @event.update(event_params.merge(creator_id: current_user.id))
      redirect_to @event, notice: 'Event updated successfully.'
    else
      render :edit, status: :unprocessable_entity
    end
    authorize @event
  end

  def destroy
    get_event_by_id
    @event.destroy
    flash.notice = 'Event was deleted.'
    redirect_to(@event)
    authorize @event
  end

  def my_event
    @created_event = current_user.attended_events.all
  end

  def past
    get_all_event
  end

  def upcoming
    get_all_event
  end

  def current
    get_all_event
  end

  def get_all_event
    @events = Event.all
  end

  def get_event_by_id
    @event = Event.find(params[:id])
  end

  def event_params
    params.require(:event).permit(:name, :description, :location, :date, :image)
  end
end
