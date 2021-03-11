# frozen_string_literal: true

class Event::Update
  def initialize(event, params)
    @event = event
    @params = params
  end

  def call
    @event.update(@params)
  end
end
