class TimelineController < ApplicationController
  def show
  end

  def index
    if params[:category]
      events = Event.where(:category => params[:category])
    else
      events = Event.scoped
    end
    @events = events.order("valid_from ASC, valid_to DESC")
  end
end
