Shoes.app width: 720, height: 480 do
  background "#000"
  @clock = para "00:00"
  @clock.style(:stroke => red, :font => "130")

  @temperature = para "00C "
  @temperature.style(:stroke => red, :font => "40")

  @humidity = para "00%"
  @humidity.style(:stroke => red, :font => "40")

  every 1 do 
    @clock.text = Time.now.strftime("%H:%M")
    
  end
 end
 
