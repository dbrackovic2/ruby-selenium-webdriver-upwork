require "selenium-webdriver"

class HomePage
  @driver
  @wait
  def initialize(driver,wait)
    @driver=driver
    @wait=wait
  end

  def waitForPageToLoad
    @wait.until { @driver.find_element(css: 'input[name="q"]').displayed? }
    @wait.until { @driver.find_element(xpath: "//button[contains(text(),'Find Talent')]").displayed? }
  end
  def searchByKeyword(keyword)
    @driver.find_element(css: 'form[action="/search/profiles/"] input[type="search"]').send_keys(keyword)
    @driver.find_element(css: 'a[data-cy="menuitem-freelancers"]').click
  end
end
