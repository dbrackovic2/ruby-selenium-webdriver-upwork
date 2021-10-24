require "selenium-webdriver"

class BrowserConfig
  attr_accessor :driver, :wait
  def initialize(browser)
    if browser == "firefox"
        @@driver = Selenium::WebDriver.for :firefox
    else
        @@driver = Selenium::WebDriver.for :chrome
    end
    @@wait = Selenium::WebDriver::Wait.new(timeout: 50)
  end
  def self.driver
    return @@drive
  end
  def self.wait
    return @@wait
  end
  def self.openURL(url)
    @@driver.manage.window.maximize
    @@driver.navigate.to url
  end

  def self.quitBrowser
    @@driver.quit
  end
end
