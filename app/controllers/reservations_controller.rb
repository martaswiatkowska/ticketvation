# frozen_string_literal: true

class ReservationsController < ApplicationController
  before_action :set_event, only: %i[ show edit update destroy ]
  
  def index
  end

  def new
    @event = Event.joins(:place).find(params[:event])
    @reservation = Reservation.new(event: @event)
    @seats = @event.place.seats
  end
  
  def create
    @event = Event.find(params[:event_id])
    @reservation = Reservation.new(event_params, event: @event)

    respond_to do |format|
      if @reservation.save
        format.html { redirect_to events_path }
        format.json { render :show, status: :created, location: @resevrvation.event }
      else
        format.html { render :new, status: :unprocessable_entity, events: @events}
        format.json { render json: @reservation.errors, status: :unprocessable_entity, event: @event }
      end
    end
  end


  private
    def set_event
      @reservation = Reservation.find(params[:id])
    end

    def event_params
      params.require(:reservation).permit(:name, :surname, :email, :event_id, [seat_ids: []])
    end
end
