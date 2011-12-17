class TimelineController < ApplicationController
  def show
  end

  def index
    @events = [
      Event.new(valid_from: Date.new(2011, 6, 10), valid_to: Date.new(2011, 12, 15), published_at: Date.new(2011, 10, 9)),
      Event.new(valid_from: Date.new(2011, 1, 9), valid_to: Date.new(2011, 1, 15), published_at: Date.new(2011, 3, 4))
    ]
  end
end
