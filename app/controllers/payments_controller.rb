# frozen_string_literal: true

class PaymentsController < ApplicationController
  def index
    @reservation = Reservation.find(params[:reservation_id])

  end

  def show
  end

  def new
    @reservation = Reservation.find(params[:reservation_id])

  end

  def edit
  end

  def create
    @reservation = Reservation.find(params[:id])
    token = params[:stripeToken]

    charge = Stripe::Charge.create(
      amount: @reservation.amount,
      currency: "EUR",
      description: "Payment for reservation: %s" % @reservation.id,
      source: token
    )
    # Adapters::Payment::Getway.new(@reservation.amount, token).charge 
    Reservation::Update.new(status: :confirmed).call
    redirect_to events_path, notice: "Payment success. Your reservation is confirmed"

    rescue Stripe::CardError => e
      flash.alert = e.message
      render action: :new
   end
end
