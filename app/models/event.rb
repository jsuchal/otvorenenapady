class Event < ActiveRecord::Base
  belongs_to :detailed, :polymorphic => true

  def interval?
    valid_to
  end
end
