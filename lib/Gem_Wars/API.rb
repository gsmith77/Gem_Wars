class GemWars::API

  def self.get_info
    #binding.pry
    web_contents = open('https://swapi.co/api/people') {|f| f.read }
    rez = JSON.parse(web_contents)
    all = rez["results"]
    i = 2
    while i <= 9 do
      web_contents = open(rez["next"]) {|f| f.read }
      rez = JSON.parse(web_contents)
      all += rez["results"]
      i += 1
    end
    all
  end
end
