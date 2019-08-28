require 'open-uri'
require 'json'

module ShowList
  class API 
    def self.get_shows 
      json_string = open("http://api.tvmaze.com/shows").read
      JSON.parse(json_string)
    end
  end
end
