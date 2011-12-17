require 'csv'
namespace :everyblock do
  desc "Load restaurant reviews"
  task "load:restaurants" => :environment do
    CSV.foreach(Rails.root.join("db", "restiky.csv"), :headers => true) do |row|
      e = Event.new
      e.title = "Recenzia podniku #{row['name']}"
      e.message = row['review']
      e.url = row['url']
      e.published_at = row['published_at']
      e.category = "Review"
      e.location_label = row['address']
      r = Review.new
      r.name = row['name']
      r.website = row['website']
      r.address= row['address']
      r.event = e
      r.save
    end
  end

  desc "Load news"
  task "load:news" => :environment do
    CSV.foreach(Rails.root.join("db", "spravy.csv"), :headers => true) do |row|
      e = Event.new
      e.title = row['title']
      e.message = row['message']
      e.category = row['category']
      e.location_label = row['location_label']
      e.url = row['url']
      e.published_at = row['published_at']
      e.valid_from = row['valid_from']
      e.valid_to = row['valid_to']
      e.save
    end
  end
end