class ResetAllEventCacheCounters < ActiveRecord::Migration[6.0]
  def change
    Event.all.each do |event|
      Event.reset_counters(event.id, :reservations)
    end
  end
end
