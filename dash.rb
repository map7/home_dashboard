require 'net/http'
require 'json'
#require 'byebug'

url = 'https://api.thingspeak.com/channels/1097373/feeds/last.json'
uri = URI(url)

Shoes.app fullscreen: true, width: 800, height: 400 do
  background "#000"
  @clock = para "00:00"
  @clock.style(:stroke => red, :font => "230")

  @temperature = para "00C "
  @temperature.style(:stroke => red, :font => "70")

  @humidity = para "00%"
  @humidity.style(:stroke => red, :font => "70")

  every 1 do 
    @clock.text = Time.now.strftime("%H:%M")

    # Update Temperature & Humidity
    response = Net::HTTP.get(uri)
    response = JSON.parse(response)
    @temperature.text = response["field1"].to_i.to_s.rjust(2,"0") + "C " 
    @humidity.text = response["field2"] + "%"
  end
 end
 
