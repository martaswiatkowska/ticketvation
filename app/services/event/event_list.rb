# frozen_string_literal: true

class Event::EventList
  class ValidationError < StandardError; end

  ALLOWED_PARAMS = [:filter, :event_date, :place_name, :seats_number]

  def initialize(params)
    @params = params
  end

  def call
    validate_params!
    filter = @params[:filter]
    seats_number = filter.dig(:filter, :seats_number).to_i
    
    case
    when filter.dig(:event_date)
      output = Event.continues_in_date(filter[:event_date])
      output = output.joins(:place).where("places.seats_count > ?", filter[:seats_number]) if filter.dig(:seats_number)
      output
    when filter.dig(:place_name)
      output = Event.take_place(filter[:place_name])
      output = output.where("places.seats_count > ?", filter[:seats_number]) if filter.dig(:seats_number)
      output
    else
      Event.all
    end
  rescue ValidationError => e
    { success: false, errors: e, error_message: e.message }
  end

  def validate_params!
    unless @params.dig(:filter)
      raise ValidationError.new("Wrong parameter")
    else
      raise ValidationError if !@params[:filter].keys { |k| ALLOWED_PARAMS.include?(k) }
    end
  end
end
