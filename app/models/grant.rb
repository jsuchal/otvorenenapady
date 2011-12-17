class Grant < ActiveRecord::Base
  has_one :event, :as => :detailed
end