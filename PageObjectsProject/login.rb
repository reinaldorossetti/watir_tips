require 'watir'
require_relative 'page_base_web.rb'
require_relative 'user_page'

class LoginPage < PageBaseWeb

  URL = "https://www.w3schools.com/html/html_forms.asp"


  def initialize(driver)
    @browser = driver
  end

  def open
    @browser.goto URL
    self
  end

  def login_as(user, pass)

    send_keys(user_field, user)
    send_keys(password_field,pass)
    click(login_button)

  end

  # Web elements in page login.

  def user_field
    @browser.text_field(:name => "firstname")
  end

  def password_field
    @browser.text_field(:name => "lastname")
  end

  def login_button
    @browser.button(:type => "submit")
  end
end # LoginPage

