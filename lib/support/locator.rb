require 'cgi'
require 'open-uri'

module Support

  class Locator

    def distance(place_from, place_to)
      from_lat, from_lon = gps(place_from)
      to_lat, to_lon = gps(place_to)
      return nil if from_lat.nil? or to_lat.nil?
      calc_distance(from_lat, from_lon, to_lat, to_lon)
    end

    def gps(place)
      lat, long = extract_geoposition(download_geoposition(place))
    end


    def rad2deg(rad)
       return rad * 180.0 / Math::PI
    end

    def deg2rad(degree)
       return degree * Math::PI / 180.0
    end

    def calc_distance(from_lat, from_lon, to_lat, to_lon)
      theta = from_lon - to_lon
      dist = Math.sin(deg2rad(from_lat)) * Math.sin(deg2rad(to_lat)) + Math.cos(deg2rad(from_lat)) * Math.cos(deg2rad(to_lat)) * Math.cos(deg2rad(theta))
      dist = Math.acos(dist)
      dist = rad2deg(dist)
      dist = dist * 60 * 1.1515
      dist = dist * 1.609344
      return (dist)
    end

    def extract_geoposition(text)
      return nil, nil if text.nil?
      match = text.match(/<lat>(.*?)<\/lat>/m)
      return nil, nil if match.nil?
      lat = match[1].to_f
      match = text.match(/<lng>(.*?)<\/lng>/m)
      return nil, nil if match.nil?
      long = match[1].to_f
      return lat, long
    end

    @@cache = {}
    def download_geoposition(query)
      #url = "http://where.yahooapis.com/geocode?appid=nrsr&q=#{query.gsub(/\n/,' ')}"
      url =  "http://maps.googleapis.com/maps/api/geocode/xml?&sensor=false&address=#{CGI::escape query.gsub(/\n/,' ')}"
      response = @@cache[url]
      if response.nil? or ''==response
        open(url) do |f|
          response = f.read
        end
      end
      @@cache[url] = response
      return response
    end

  end

end