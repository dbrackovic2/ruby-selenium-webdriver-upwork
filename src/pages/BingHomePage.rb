require "selenium-webdriver"
require_relative "../configs/testConfig.rb"

class BingHomePage
  BING_LOGO     = { css: 'svg[id="bLogo"]' }
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
      @driver.get(@config.getBingUrl)
  end

  def waitForPageToLoad
      @wait.until { @driver.find_element(SEARCH_INPUT).displayed? }
      @wait.until { @driver.find_element(BING_LOGO).displayed? }
      puts "Bing home page loaded."
  end

  def searchByKeyword(keyword)
      @driver.find_element(SEARCH_INPUT).send_keys(keyword)
      @driver.action.send_keys(:enter).perform
      puts "Searching on bing by keyword #{keyword}"
  end
end
  