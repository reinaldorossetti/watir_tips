# watir_tips
Vamos mostrar os comandos do Watir Framework em Ruby.

# Para instalar o Watir, devemos enviar o comando abaixo para o cmd/shell/prompt do sistema:
```ruby
gem install watir-webdriver
```

# Após a instalação da biblioteca do Watir, devemos importar a biblioteca e instanciar o driver para poder usar as
# funções que o framework tem disponível.
```ruby
require 'watir-webdriver'
browser = Watir::Browser.new :firefox
```

# Watir pegar a localização de um elemento:<br>
location = browser.element(:id, 'id').wd.location<br>
puts "location x = #{location[0]}"<br>
puts "location y = #{location[1]}"


browser.textarea(:class, 'element textarea medium').focus



