require "selenium-webdriver"

class SearchProfilesPage
  FREELANCERS_TITLES = { css: "p.freelancer-title strong" }
  FREELANCERS  = { css: "p.freelancer-title" }
  TOP_UPWORK_FREELANCERS_HEADING = { xpath: "//h1[contains(text(),'Top Upwork freelancers')]" }
  FREELANCER_NAME = { css: 'div.identity-name' }
  DESCRIPTIONS = { xpath: "//div[contains(@class,'profile-stats')]/following-sibling::div[1]/div[2]" }
  def SKILLS(n)= { xpath: "(//div[contains(@class,'skills')])[#{n}]//div[@class='up-skill-badge']" }
  @driver
  @wait
  def initialize(driver,wait)
    @driver=driver
    @wait=wait
  end

  def waitForPageToLoad
    @wait.until { @driver.find_element(TOP_UPWORK_FREELANCERS_HEADING).displayed? }
    puts "Search/profiles page opened."
  end
  def verifyKeywordForFreelancers(keyword)
    @freelancerNames = @driver.find_elements(FREELANCER_NAME)
    @freelancerTitles = @driver.find_elements(FREELANCERS_TITLES)
    @freelancerDescriptions = @driver.find_elements(DESCRIPTIONS)
    for i in 1..@freelancersNames.length()
      n = @freelancerNames[i-1].text
      t = @freelancersTitles[i-1].text
      d = @freelancerDescriptions[i-1].text
      s = @driver.find_elements(SKILLS(i))
      default = false
      # This each loop checks if freelancer has a skill matching keyword param
      s.each { |i|
        if i.text().downcase().count(keyword) > 0
         default = true
         break
        end
      }
      # Print out if freelancer has a skill matching keyword
      if default == true
        puts "Freelancer #{n} has a #{keyword} skill"
      end
      # Print out if freelancer doesn't have a skill matching keyword
      if default == false
        puts "Freelancer #{@n} does not have a #{keyword} skill"
      end
      # Print out if freelancer's description or title contain keyword
      if title.downcase().count(keyword) > 0 || description.downcase().count(keyword) > 0
        puts "Freelancer #{@n} knows #{keyword}"
      else
        puts "Freelancer #{@n} does not know #{keyword}"
      end
    end
  end
end
