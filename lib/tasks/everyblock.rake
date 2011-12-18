# encoding: utf-8
require 'support/locator'
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

  desc "Load discounts"
  task "load:discounts" => :environment do
    CSV.foreach(Rails.root.join("db", "zlavy.csv"), :headers => true) do |row|
      e = Event.new
      e.title = "Zlava: #{row['title']}"
      e.message = row['name']
      e.location_label = row['address']
      e.published_at = row['published_at']
      e.valid_from = row['valid_from']
      e.valid_to = row['valid_to']
      e.url = row['url']
      e.category = "Discount"
      e.save
    end
  end

  desc "Load grants"
  task "load:grants" => :environment do
    CSV.foreach(Rails.root.join("db", "fondy.csv"), :headers => true) do |row|
      e = Event.new
      e.title = "Projekt europskych fondov: #{row['project']}"
      e.message = row['description']
      e.location_label = row['address']
      e.published_at = row['published_at']
      e.valid_from = row['valid_from']
      e.valid_to = row['valid_to']
      e.category = "Grant"
      g = Grant.new
      g.subject = row['subject']
      g.budget = row['budget']
      g.event = e
      g.save
    end
  end

  desc "Gps locations for events"
  task "events:locations" => :environment do
    locator = Support::Locator.new
    Event.all.each do |event|
      event.lat, event.lng = locator.gps(event.location_label)
      puts "event:#{event.id} is at GPS #{event.lat}:#{event.lng}"
      event.save
    end
  end

end