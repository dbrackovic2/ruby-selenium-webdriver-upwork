require "selenium-webdriver"

class ProfileSlider
  FREELANCERS_TITLES = { css: "p.freelancer-title strong" }
  FREELANCERS  = { css: "p.freelancer-title" }
  FREELANCER_NAME = { css: 'div.identity-name' }
  PROFILE_TITLE = { xpath: '(//section[contains(@class,"up-card-section")])[7]//h2' }
  @driver
  @wait
  def initialize(driver,wait)
    @driver=driver
    @wait=wait
  end

  def openFirstProfile
    @title = @driver.find_element(FREELANCERS_TITLES).text
    @freelancerName = @driver.find_element(FREELANCER_NAME).text
    @driver.find_element(FREELANCERS).click
    puts "#{@freelancerName} profile slider opened."
  end

  def verifyTitleMatchesWithTitleOnSearchProfiles
    @wait.until { @driver.find_element(PROFILE_TITLE).displayed? }
    profileTitle = @driver.find_element(PROFILE_TITLE).text
    if profileTitle.downcase() == @title.downcase()
      puts "Freelancer #{@freelancerName} profile title matches with one on search/profiles page."
    end
  end

end
