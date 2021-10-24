require "selenium-webdriver"

class SearchProfilesPage
  @driver
  @wait
  def initialize(driver,wait)
    @driver=driver
    @wait=wait
  end

  def waitForPageToLoad
    @wait.until { @driver.find_element(xpath: "//h1[contains(text(),'Top Upwork freelancers')]").displayed? }
  end
  def verifyKeywordForFreelancers(keyword)
    title = @driver.find_element(css: "p.freelancer-title strong").text
    description = @driver.find_element(xpath: "//div[contains(@class,'profile-stats')]/following-sibling::div[1]/div[2]")
    skills = @driver.find_elements(xpath: "(//div[contains(@class,'skills')])[1]//div[@class='up-skill-badge']")
    default = false
    skills.each { |i|
      if i.text().downcase().count(keyword) > 0
       default = true
       break
      end
    }

    if default == true
      puts "freelancer " + @driver.find_element(css: 'div.identity-name').text + " has a #{keyword} skill"
    end
    if default == false
      puts "freelancer " + @driver.find_element(css: 'div.identity-name').text + " does not have a #{keyword} skill"
    end

    if title.downcase().count(keyword) > 0 || description.downcase().count(keyword) > 0
      puts "freelancer " + @driver.find_element(css: 'div.identity-name').text + " knows #{keyword}"
    end

  end
end
