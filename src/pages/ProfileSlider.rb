require "selenium-webdriver"

class ProfileSlider
  @driver
  @wait
  def initialize(driver,wait)
    @driver=driver
    @wait=wait
  end

  def openFirstProfile
    @title = @driver.find_element(css: "p.freelancer-title strong").text
    @driver.find_element(css: "p.freelancer-title").click
  end

  def verifyTitleMatchesWithTitleOnSearchProfiles
    @wait.until { @driver.find_element(xpath: '(//section[contains(@class,"up-card-section")])[7]//h2').displayed? }
    profileTitle = @driver.find_element(xpath: '(//section[contains(@class,"up-card-section")])[7]//h2').text
    if profileTitle.downcase() == @title.downcase()
      puts "freelancer " + @driver.find_element(css: 'div.identity-name').text + " profile title matches"
    end
  end

end
