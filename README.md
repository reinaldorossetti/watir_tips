# watir_tips
Vamos mostrar os comandos do Watir Framework e Selenium WebDriver em Ruby.


# Watir pegar a localização de um elemento:
location = browser.element(:id, 'id').wd.location
puts "location x = #{location[0]}"
puts "location y = #{location[1]}"


