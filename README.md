# watir_tips
No meu emprego atual, alguns projetos a galera implementou o Watir Framework, é um framework pouco falado no brasil, geralmente se fala mais do Capybara, o Capybara tem uma comunidade mais forte podemos falar. A muito tempo atrás eu já tinha lido alguma coisa no blog do desenvolvedor, mas nunca usei esse framework e nem sabia as vantagens de usar ele, neste post ou nesse publicação vamos falar um pouco dele, pois eu mesmo tenho que estudar mais, e eu aprendendo mais quando passo conhecimento. Agora vamos mostrar os comandos do Watir Framework em Ruby, no final vamos falar da principal vantagem dele.

### Para instalar o Watir, devemos enviar o comando abaixo para o cmd/shell/prompt do sistema:
```ruby
gem install watir
```

### Após a instalação da biblioteca do Watir, devemos importar a biblioteca e instanciar o driver para poder usar as funções que o framework tem disponível.
```ruby
require 'watir'
driver = Watir::Browser.new :firefox
```

### Para carregar a URL do Browser devemos usar a função "goto".
```ruby
require 'watir'
driver = Watir::Browser.new :firefox # should open a new Firefox window
driver.goto 'http://nitrowriters.com/form/form.html'
```

### Para carregar a URL com o Browser padrão, ou seja não precisa usar a função "goto" usando essa forma, o padrão é o chrome.
```ruby
require 'watir'
driver = Watir::Browser.start 'bit.ly/watir-webdriver-demo'
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

### Esperas Dinamicas - Para efetuar um clique e colocar a espera até o elemento estar presente, fazemos assim.
### O padrão da espera interna é de 30 segundos e o intervalo que verificação é de 0.1
```ruby
driver.radio(:name => 'familiar_rails', :value => '3').wait_until_present.click
driver.checkbox(:index => 2).wait_until_present.click
driver.textarea(:class => 'element textarea medium').wait_until_present.click

# outra forma é usar a função generica de espera wait_until(&:present?).
web_element = driver.checkbox(:index => 2)
if web_element.wait_until(&:present?)
  web_element.click
end

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
### A função wait_until_present e wait_while_present, tem o timeout padrão igual a 30 segundos de acordo com a documentação.
```ruby

# Vai dar o clique quando o botão estiver presente.
elem = driver.button(:id => "send").wait_until_present   
elem.click 

# Vai dar o clique quando o botão estiver presente, espera até 2 segundos, você pode determinar o tempo que deseja.
driver.button(:id => "send").wait_until_present(2).click # time out after 2 seconds 

# Outra forma de fazer usando o colchetes.
driver.div(:id => "container").wait_until_present { |div| div.button.click }

# A função **wait_while_present** faz o contrário do wait_until_present, ele espera o elemento desaparecer.
driver.div(:id => "container").wait_while_present 

# Verifica se o elemento está visivel e se existe, o retorno é true ou false.
driver.div(:id => "foo").present?

# espera se o título da página é igual o que você passou, mas ele já faz a espera dinâmica.
Watir::Wait.until { browser.title == "Your Profile" }

# Envia um determinado texto para o elemento "b", que está em um outro frame, isso é feito em uma linha.
b.frame(id: 'content_ifr').send_keys 'hello world'
b.frame(:id => 'top_right').link(:index => 0).click
driver.frame(:id => "FCCBMain").frameset.frameset.frame(:id => "MainLeft").id

browser.alert.ok # confirma o alerta.
browser.alert.text # pega o texto de um alerta
browser.alert.close # fecha o alerta.
browser.alert.exists? # verifica se o alerta existe.
```

### Dando o clique no botão em uma nova janela.
```ruby
# mudando de janela mantendo um bloco de código, ou seja somente vai funcionar nesse bloco de código na segunda janela,
# quando sair ele vai fazer referência a janela anterior.
driver.window(title: 'annoying popup') do
  driver.button(id: 'field').send_keys "teste"
  driver.button(id: 'close').click
  browser.title # => "Titulo da Segunda janela"
end
browser.title # => "Titulo da Primeira janela"

# Outras opções:
driver.window(:index => 1).use # vai mudar o foco para essa janela.
driver.window(:url => /closeable\.html/).use # Exemplo usando Regex.
driver.window(:title => "closeable window").use # Exemplo usando o titulo da janela.
```

### Usando javascript no Watir podemos fazer várias coisas.
```ruby

# Enviando a string 'my name' para o alert do tipo prompt. 
driver.execute_script("window.prompt = function() {return 'my name'}")

# Enviando um valor null para o alert do tipo prompt, isso simula um cancelar. 
driver.execute_script('window.prompt = function() {return null}')

# Simular clicando no botão OK.
driver.execute_script('window.confirm = function() {return true}')

# Simular clicando em um botão Cancelar.
driver.execute_script('window.confirm = function() {return false}')

# Não retorna nada, somente fecha o popup.
driver.execute_script('window.onbeforeunload = null')
```
### Disparando um determinado evento html, podemos fazer assim no watir
```ruby
f = driver.iframes[1] # estou usando o conteiner de objetos do watir para filtrar o elemento.
imagem  = f.imgs[0]
imagem.fire_event('onmouseover')
```

  O Watir tem vários comandos curtos pra realizar as ações, mas não ache que ele é melhor que o selenium, pois a base dele é selenium puro. O framework foi baseado no selenium, e o autor implementou várias camadas de abstração pra facilitar o uso, através do selenium você mesmo pode implementar o seu próprio framework, mas não dá pra negar que as implementações são muito boas, principalmente a parte do mapeamento de elementos.<br>
  No exemplo abaixo, temos todos os elementos com atributos iguais e todos são tags div, no watir ele auto mapea os elementos, já tendo a função div disponível, você somente precisa passar o index que vai identificar o elemento que deseja, ele chama isso de container de objetos html, o que torna o trabalho de mapeamento mais fácil no Watir Framework.<br>
  Pra finalizar o post, vem aquela pergunta será que funciona bem? Eu posso garantir que ele funciona bem, pois foi entregue um projeto com mais de 2000 casos de testes com ele, usando o PageObjects, vamos falar do PageObjects com ele em um outro post.

```html
<html>
    <body>
        <div class="example">1111</div>
        <div class="example">2222</div>
        <div class="example">3333</div>
        <div class="example">4444</div>
        <div class="example">5555</div>
    </body>
</html>
```
``` Ruby
puts browser.div(:class => "example", :index => 3).text
# ou
puts browser.div(:class => "example", :text => 5555).text

# Em Watir pra imprimir todas as divs (browser.divs)
puts browser.divs(:class => "example").map(&:text)
```


**Vamos comparar com o Selenium em Java:**

``` Java
@FindBy(id = "id_time_zone")
WebElement editSubOrg_timezone;

  List<String> getAllOptions(By by) {
      List<String> options = new ArrayList<String>();
      for (WebElement option : new Select(driver.findElement(by)).getOptions()) {
          if (option.getAttribute("value") != "") options.add(option.getText());
      }
      return options;
  } 

List<String> options = getAllOptions(editSubOrg_timezone);
System.out.println(options);

```

**Em Watir a mesma coisa:**
``` Ruby
  ELEM_SELECT = {id: "id_time_zone"}
  
  def select_list_text(locator_select)
    Watir::Wait.until { @driver.select_list(locator_select).options.length > 0}
    @driver.select_list(locator_select).options.map(&:text)
  end
  
  puts select_list_text(ELEM_SELECT)
```
<b>Sem dúvida em ruby com Watir é muito mais simples fazer, sem contar que a função está esperando o combobox ter valores, ou seja espera espera o options.length > 0 ser igual a true, por 30 segundos. Em Java precisaria colocar um Thread.sleep fazendo um loop e verificando o valor do conteúdo por 30 segundos, bem mais complicado adicionando mais um loop, no Watir já é padrão e a espera é dinâmica. Um comando legal do Watir é o flash que vai iluminar o elemento web, você pode definir a cor, quantidade de flashes e o delay, o watir é um framework bem flexível, você consegue montar sua PageBase (Classe com funções genéricas) com bastante recursos.
</b><br><br>
Exemplo do comando Flash:<br>
element.flash(color: "green", flashes: 3, delay: 0.05)

Referências do Watir:<br>
http://www.rubydoc.info/github/watir/watir-classic/Watir/Container<br>
https://github.com/watir/watir/wiki<br>
http://watir.com/docs/home
