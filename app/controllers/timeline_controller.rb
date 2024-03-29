class TimelineController < ApplicationController
  def show
  end

  def index
    if params[:category]
      events = Event.where(:category => params[:category])
    else
      events = Event.scoped
    end
    @events = events.order("published_at DESC, valid_from DESC, valid_to ASC")
  end
end
