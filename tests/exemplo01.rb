require 'watir-webdriver'

browser = Watir::Browser.new :ie
browser.goto "XXX"
browser.driver.manage.window.maximize

=begin
Esse exemplo eh um pouco complexo, pois por via normal nao consigo dar o click no menu javascript.
=end

# login
browser.frame(name:'principal').input(id:'usuario').send_keys 'XXX'
browser.frame(name:'principal').input(id:'senha').send_keys 'XXX'
browser.frame(name:'principal').input(id:'button').click

def click_submenu
    x = 0
    y = 1
    tests = browser.frame(name:'principal').elements(:tag_name => "div")
    tests.each do |div|
      if div.value == "Cadastro"
        x = div.element.wd.location[0]
        y = div.element.wd.location[1]
        break
      end
    end

  browser.execute_script("document.elementFromPoint('"+x.to_s+"', '"+y.to_s+"').click()")
    tests2 = browser.frame(name:'principal').elements(:tag_name => "div")
    tests2.each do |div|
      if div.value == "Pesquisar"
        div.click
      end
    end
end

result = browser.frame(name:'principal').elements(:tag_name => "div").exists?
if result
    click_submenu # click in menu javascript.
end
