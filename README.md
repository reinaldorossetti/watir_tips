# watir_tips
Vamos mostrar os comandos do Watir Framework e Selenium WebDriver em Ruby.


# Watir pegar a localização de um elemento:<br>
location = browser.element(:id, 'id').wd.location<br>
puts "location x = #{location[0]}"<br>
puts "location y = #{location[1]}"


