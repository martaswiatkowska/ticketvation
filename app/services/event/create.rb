# frozen_string_literal: true

class Event::Create
  def initialize(event)
    @event = event
  end

  def call
    @event.save
    @event
  end
end
