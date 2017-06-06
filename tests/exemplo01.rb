require 'watir-webdriver'

x = 0
y = 1

browser = Watir::Browser.new :ie
browser.goto "XXX"
browser.driver.manage.window.maximize

browser.frame(name:'principal').input(id:'usuario').send_keys 'XXX'
browser.frame(name:'principal').input(id:'senha').send_keys 'XXX'
browser.frame(name:'principal').input(id:'button').click
sleep 7

tests = browser.frame(name:'principal').elements(:tag_name => "div")
puts tests
tests.each do |div|
  if div.value == "Cadastro"
    x = div.element.wd.location[0]
    y = div.element.wd.location[1]
    break
  end
end
puts x,y

browser.execute_script("document.elementFromPoint('"+x.to_s+"', '"+y.to_s+"').click()")
sleep 3
tests2 = browser.frame(name:'principal').elements(:tag_name => "div")
tests2.each do |div|
  if div.value == "Pesquisar"
    div.click
  end
end
