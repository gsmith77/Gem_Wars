class GemWars::Character

  @@all = {}

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
    binding.pry
    @film_urls = obj["films"]
    @@all[obj["url"]] = self
  end

  def self.info
    #binding.pry
    info = GemWars::API.get_info
    results = info.map do |object_info|
      GemWars::Character.new(object_info)
    end
    results
  end

  def self.all
    @@all
  end

  def films
    #maps overs over the film_urls and makes film objects
    @film_urls.map do |url|
      film.all[url]
    end
  end

end
