# frozen_string_literal: true

class EventsController < ApplicationController
  before_action :set_event, only: %i[show edit update destroy]

  def index
    @events = Event.all
  end

  def show; end

  def new
    @event = Event.new
  end

  def edit; end

  def create
    @event = Event.new(event_params)

    if Event::Create.new(@event).call
      redirect_to @event, notice: "Event was successfully created"
    else
      render :new, status: :bad_request
    end
  end

  def update
    if Event::Update.new(event_params).call
      redirect_to @event, notice: "Event was successfully created"
    else
      render :new, status: :bad_request
    end
  end

  def destroy
    @event.destroy
    redirect_to events_url, notice: "Event was successfully destroyed."
  end

  def event_list
    output = Event::EventList.new(params).call
    render json: output.to_json(only: [:name])
  end

  private
    def set_event
      @event = Event.find(params[:id])
    end

    def event_params
      params.require(:event).permit(:start_date, :end_date, :name, :description, :place_id)
    end
end
