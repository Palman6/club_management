# frozen_string_literal: true

# This controller provides the participants contol for events
class AttendingsController < ApplicationController
  include Pundit::Authorization

  def create
    if Attending.find_by(attendee_params).nil?
      @attending = Attending.new(attendee_params)

      if @attending.save
        flash.notice = 'Registered successfully.'
        redirect_to(@attending.attended_event)
      end
      authorize @attending
    else
      flash.notice = 'You are already attending.'
    end
  end

  def destroy
    @attending = Attending.find_by(attendee_params)

    if @attending.destroy
      flash[:notice] = t('.flash.notice')
    else
      flash[:alert] = t('.flash.notice')
    end
    redirect_to(@attending.attended_event)
  end

  def attendee_params
    params.permit(:attendee_id, :attended_event_id)
  end
end
