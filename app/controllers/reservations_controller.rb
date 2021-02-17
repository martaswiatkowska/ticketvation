# frozen_string_literal: true

class ReservationsController < ApplicationController
  def index; end

  def new
    @event = Event.joins(:place).find(params[:event])
    @reservation = Reservation.new(event: @event)
    @seats = @event.place.seats
  end  
  
  def create
    @event = Event.find(params[:event_id])
    #@reservation = Reservation.new(event_params, event: @event)
    @reservation = Reservation::Create.new(event_arams).call
    
    if @reservation.persisted?
      redirect_to events_path
    else
      render :new, status: :bad_request
    end
  end

  private
    def event_params
      params.require(:reservation).permit(:name, :surname, :email, :event_id, [seat_ids: []])
    end
end
