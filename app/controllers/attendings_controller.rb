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
      flash[:notice] = if @attending.attendee_id == current_user.id
                         t('.flash.notice')
                       else
                         t('.flash.notice1')
                       end
    else
      flash[:alert] = t('.flash.alert')
    end
    redirect_to(@attending.attended_event)
    return unless @attending.attendee_id != current_user.id

    AttendeeMailer.attendee_remove_email(@attending.attendee_id, @attending.attended_event_id).deliver_later
  end

  def attendee_params
    params.permit(:attendee_id, :attended_event_id)
  end
end
