class PokeDEXCLI::Pokemon
    attr_accessor :name, :id, :height, :weight

    @@all = []

    def initialize(attr_hash)
        attr_hash.each do |key, value|
            self.send("#{key}=", value) if self.respond_to?("#{key}=")
    end
    self.save
  end

 def save
    @@all << self
 end

 def self.all
    @@all
 end
end        
        
       
       
