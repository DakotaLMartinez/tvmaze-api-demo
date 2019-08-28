puts "Hello from ShowList::Show"
module ShowList
  class Show 
    attr_accessor :name, :summary
    
    def self.all 
      @@all ||= self.load
    end
    
    def self.load 
      API.get_shows.collect do |show_hash|
        Show.new(show_hash)
      end
    end
    
    def initialize(attributes = {})
      @name = attributes["name"]
      @summary = attributes["summary"]
    end
  end
  
end