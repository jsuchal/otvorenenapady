class Review < ActiveRecord::Base
  has_one :event, :as => :detailed

end