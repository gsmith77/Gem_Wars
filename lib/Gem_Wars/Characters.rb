class GemWars::Characters

  @@all = []
  
  attr_accessor :obj, :name, :type, :genres, :summary
  
  def initialize(obj)
    @obj = obj
    @name = obj["name"]
    @type = obj["type"]
    @genres = obj["genres"]
    obj.each do |method, arg|
      if self.respond_to?("#{method}=")
        self.send("#{method}=", arg)
      end
    end
    @@all << self
  end
  
  def self.info
    #binding.pry
    info = GemWars::API.get_info
    results = info.map do |object_info|
      GemWars::Characters.new(object_info)
    end
    results
  end

end