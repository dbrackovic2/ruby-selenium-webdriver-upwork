require "selenium-webdriver"
require_relative "../configs/testConfig.rb"

class GoogleHomePage
  GOOGLE_LOGO   = { css: 'img[id="hplogo"]' }
  SEARCH_INPUT  = { css: 'input[name="q"]' }
  @driver
  @wait
  @config

  def initialize(driver,wait)
      @driver = driver
      @wait = wait
      @config = TestConfig.new
  end

  def open
      @driver.get(@config.getGoogleUrl)
  end

  def waitForPageToLoad
      @wait.until { @driver.find_element(SEARCH_INPUT).displayed? }
      @wait.until { @driver.find_element(GOOGLE_LOGO).displayed? }
      puts "Google home page loaded."
  end
  
  def searchByKeyword(keyword)
      @driver.find_element(SEARCH_INPUT).send_keys(keyword)
      @driver.action.send_keys(:enter).perform
      puts "Searching on google by keyword #{keyword}"
  end
end
  