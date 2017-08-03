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

### Para limpara a seleção de um determinado compo usamos a função "clear".
```ruby
driver.checkbox(:index => 1).clear
```


### Para trabalhar com campos combobox/select usamos a função "select" passando o texto que deseja selecionar no combobox e no caso da função "select_value", passamos o value do elemento, como no exemplo abaixo.
```ruby
driver.select_list(:id => 'usage').select 'Less than a year'
driver.select_list(:id => 'usage').select_value '2'
```

### No Watir para pegar um determinado atributo de um elemento, passamos o elemento com uma referência dele (:value => "Name123") ou .p(:text => 'Reinaldo') e por fim o atributo que deseja ver.

```ruby
puts driver.p(:text => 'For Watir demonstration purposes only.').id #=> output: 'my_description'
```

