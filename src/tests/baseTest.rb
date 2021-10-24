require "selenium-webdriver"

class BaseTest
  attr_accessor(:driver, :wait)
  def initialize(browser)
    if browser == "chrome"
      @driver = Selenium::WebDriver.for :chrome
    else
      @driver = Selenium::WebDriver.for :firefox
    end

    @driver.manage.window.maximize
    @driver.get("https://www.upwork.com")
    @wait = Selenium::WebDriver::Wait.new(timeout: 50)
  end

  def teardown
    @driver.quit
  end
end
