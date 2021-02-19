# frozen_string_literal: true

class ReservationsController < ApplicationController
  def new
    @event = Event.joins(:place).find(params[:event])
    @reservation = Reservation.new(event: @event)
    @seats = @event.place.seats
  end

  def create
    @event = Event.find(params[:reservation][:event_id])
    @seats = @event.place.seats

    @reservation = Reservation::Create.new(reservation_template).call
    
    if @reservation.persisted?
      redirect_to  new_payment_path(reservation_id: @reservation)
    else
      render :new, status: :bad_request
    end
  end

  def edit
    @reservation = Reservation.find(params[:id])
  end

  private

    def reservation_params
      params.require(:reservation).permit(:name, :surname, :email, :event_id, [seat_ids: []], :amount)
    end

    def reservation_template
      Reservation.new(reservation_params)
    end
end
