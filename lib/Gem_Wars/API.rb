class GemWars::API

  def self.get_info
    web_contents = open('https://swapi.co/') {|f| f.read }
    JSON.parse(web_contents)
  end

end