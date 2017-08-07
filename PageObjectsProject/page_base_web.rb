require 'watir'

class PageBaseWeb

  def initialize(browser)
    @browser = browser
  end

  def loaded?(title)
    @browser.windows.last.use do
      Watir::Wait.until { @browser.title.include? title }
      puts @browser.title
    end
  end

  def click(elem)
    elem.wait_until_present
    result = elem.exist?
    if result
      elem.click
    else
      "Element not found"
    end
  end

  def send_keys(elem, string)
    elem.wait_until_present
    result = elem.exist?
    if result
      elem.clear
      elem.set string
    else
      "Element not found"
    end
  end

end