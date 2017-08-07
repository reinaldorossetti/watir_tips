class UserPage < PageBaseWeb

  def initialize(browser)
    @browser = browser
  end

  def logged_in?(title)
    loaded? title
  end

  def logged_in_element
    @browser.windows.last.use do
      return element_result.text
    end
  end

  def element_result
    @browser.div(:class => "w3-border")
  end
end