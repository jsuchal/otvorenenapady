class TimelineController < ApplicationController
  def show
  end

  def index
    @events = Event.order("valid_from ASC, valid_to DESC")
  end
end
