# importa a biblioteca do watir
require 'watir'

# Carregamos a url usando o browser padrão o chrome.
driver = Watir::Browser.start 'bit.ly/watir-webdriver-demo'

# Procura o elemento text_field com o atributo id igual a entry_1000000.
test = driver.text_field id: 'entry_1000000'

# Valida se o atributo realmente existe, retorna true ou false
result = test.exists?

# Se o elemento existe ele continua o teste, senao nem executa o restante do teste.
if result 
  # Agora enviamos o nome Reinaldo Mateus para o campo texto.
  test.set 'Reinaldo Mateus'

  # Imprimo o value que foi preenchido no console.
  puts driver.text_field(id: 'entry_1000000').value
end
