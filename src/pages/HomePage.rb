require "selenium-webdriver"

class HomePage
  SEARCH_INPUT    = { css: 'input[name="q"]' }
  FIND_TALENT_BTN = { xpath: "//button[contains(text(),'Find Talent')]" }
  SEARCH_INPUT2   = { css: 'form[action="/search/profiles/"] input[type="search"]' }
  FREELANCERS_SEARCH_OPTION = { css: 'a[data-cy="menuitem-freelancers"]' }
  @driver
  @wait
  def initialize(driver,wait)
    @driver=driver
    @wait=wait
  end

  def waitForPageToLoad
    @wait.until { @driver.find_element(SEARCH_INPUT).displayed? }
    @wait.until { @driver.find_element(FIND_TALENT_BTN).displayed? }
    puts "Home Page loaded."
  end
  def searchByKeyword(keyword)
    @driver.find_element(SEARCH_INPUT2).send_keys(keyword)
    @driver.find_element(FREELANCERS_SEARCH_OPTION).click
    puts "Searching by keyword #{keyword}"
  end
end
