class Event < ActiveRecord::Base
  def interval?
    valid_to
  end
end
