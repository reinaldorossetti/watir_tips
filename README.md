# watir_tips
Vamos mostrar os comandos do Watir Framework em Ruby.

### Para instalar o Watir, devemos enviar o comando abaixo para o cmd/shell/prompt do sistema:
```ruby
gem install watir-webdriver
```

### Após a instalação da biblioteca do Watir, devemos importar a biblioteca e instanciar o driver para poder usar as
### funções que o framework tem disponível.
```ruby
require 'watir-webdriver'
driver = Watir::Browser.new :firefox
```

### Para carregar a URL do Browser devemos usar a função "goto".
```ruby
require 'watir-webdriver'
driver = Watir::Browser.new :firefox # should open a new Firefox window
driver.goto 'http://nitrowriters.com/form/form.html'
```

### Para enviar um texto para um campo texto ou textarea devemos usar a função "set".
```ruby
driver.text_field(:id => 'my_text_field').set 'Yes!'
driver.textarea(:class => 'element textarea medium').set 'It was a long time ago, I do not remember'
```

### Para efetuar um clique em um elemento radio, checkbox, textarea devemos usar a função "click".
```ruby
driver.radio(:name => 'familiar_rails', :value => '3').click
driver.checkbox(:index => 2).click
driver.textarea(:class => 'element textarea medium').click
```

### No Watir para pegar a localização de um elemento.
```ruby
location = driver.element(:id, 'id').wd.location
puts "location x = #{location[0]}"
puts "location y = #{location[1]}"
```

### No Watir para colocar o foco em um determinado elemento, usamos a função "focus".
```ruby
driver.textarea(:class, 'element textarea medium').focus
```

### No Watir para pegar o texto de um determinado elemento usamos a função "text".
```ruby
puts driver.p(:id => 'my_description').text
```


### Trabalhando com upload de arquivo.
```ruby
driver.file_field.set 'C:/watir.txt'
```

### Para limpara a seleção de um determinado campo usamos a função "clear".
```ruby
driver.checkbox(:index => 1).clear
```


### Para trabalhar com campos combobox/select usamos a função "select" passando o texto que deseja selecionar no combobox e no caso da função "select_value", passamos o value do elemento, como no exemplo abaixo.
```ruby
driver.select_list(:id => 'usage').select 'Less than a year'
driver.select_list(:id => 'usage').select_value '2'
```

### No Watir para pegar um determinado atributo de um elemento, passamos o elemento com uma referência dele .input(:value => "Name123") ou .p(:text => 'Reinaldo') e por fim o atributo que deseja ver.

```ruby
puts driver.p(:text => 'For Watir demonstration purposes only.').id #=> output: 'my_description'
```

### No Watir para verificar se um determinado elemento foi dado o click ou set no caso do radio button, usamos o "set?" com uma interrogação no final vai retornar true ou false.
```ruby
driver.radio(:name => 'familiar_rails', :value => '1').click
driver.radio(:name => 'familiar_rails', :value => '1').set? #=> true
driver.radio(:name => 'familiar_rails', :value => '3').set # same as click 
driver.radio(:name => 'familiar_rails', :value => '1').set? #=> false
```

### Agora vamos ver as coisas legais do Watir, comandos curtos que podemos fazer com facilidade.
```ruby

# Vai dar o clique quando o botão estiver presente (timeout of 30 seconds).
driver.button(:id => "send").when_present.click    

# Vai dar o clique quando o botão estiver presente, espera até 2 segundos, você pode determinar o tempo que deseja.
driver.button(:id => "send").when_present(2).click # time out after 2 seconds 

# Outra forma de fazer usando o colchetes.
driver.div(:id => "container").when_present { |div| div.button.click }

# Verifica se o elemento está visivel e se existe, o retorno é true ou false.
driver.div(:id => "foo").present?

# espera se o título da página é igual o que você passou, mas ele já faz a espera dinâmica.
Watir::Wait.until { browser.title == "Your Profile" }

# Envia um determinado texto para o elemento "b", que está em um outro frame, isso é feito em uma linha.
b.frame(id: 'content_ifr').send_keys 'hello world'
```

### Dando o clique no botão em uma nova janela.
```ruby
driver.window(title: 'annoying popup').use do
  driver.button(id: 'close').click
end
```

### Usando javascript no Watir podemos fazer várias coisas.
```ruby
# don't return anything for alert
driver.execute_script('window.alert = function() {}')

# return some string for prompt to simulate user entering it
driver.execute_script("window.prompt = function() {return 'my name'}")

# return null for prompt to simulate clicking Cancel
driver.execute_script('window.prompt = function() {return null}')

# return true for confirm to simulate clicking OK
driver.execute_script('window.confirm = function() {return true}')

# return false for confirm to simulate clicking Cancel
driver.execute_script('window.confirm = function() {return false}')

# don't return anything for leave page popup
driver.execute_script('window.onbeforeunload = null')
```
