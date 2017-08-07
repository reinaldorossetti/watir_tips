require 'watir'
require_relative "login"

@browser = Watir::Browser.new :chrome
login_page = LoginPage.new(@browser)

login_page = login_page.open
login_page.login_as "Mom", "s3cr3t"

user_page = UserPage.new(@browser)
puts user_page.logged_in?("Forms action page")
puts user_page.logged_in_element