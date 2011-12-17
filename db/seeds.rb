# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

require 'csv'

CSV.foreach(Rails.root.join("db","spravy.csv"), :headers => true) do |row|
  e = Event.new
  e.category = row['category']
  e.location_label = row['location_label']
  e.url = row['url']
  e.published_at = row['published_at']
  e.valid_from = row['valid_from']
  e.valid_to = row['valid_to']
  e.save
end
