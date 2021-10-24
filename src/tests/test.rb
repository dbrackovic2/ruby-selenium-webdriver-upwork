require "selenium-webdriver"

driverFF = Selenium::WebDriver.for :firefox
driverCH = Selenium::WebDriver.for :chrome
wait = Selenium::WebDriver::Wait.new(timeout: 30)

driverFF.manage.window.maximize

driverFF.navigate.to "https://www.upwork.com"
wait.until { driverFF.find_element(css: 'input[name="q"]').displayed? }
wait.until { driverFF.find_element(xpath: "//button[contains(text(),'Find Talent')]").displayed? }
driverFF.find_element(css: 'form[action="/search/profiles/"] input[type="search"]').send_keys("ruby")
driverFF.find_element(css: 'a[data-cy="menuitem-freelancers"]').click
wait.until { driverFF.find_element(xpath: "//h1[contains(text(),'Top Upwork freelancers')]").displayed? }
title = driverFF.find_element(css: "p.freelancer-title strong").text
description = driverFF.find_element(xpath: "//div[contains(@class,'profile-stats')]/following-sibling::div[1]/div[2]")
skills = driverFF.find_elements(xpath: "(//div[contains(@class,'skills')])[1]//div[@class='up-skill-badge']")
default = false
skills.each { |i|
  if i.text().downcase().count("ruby") > 0
   default = true
   break
  end
}

if default == true
  puts "freelancer " + driverFF.find_element(css: 'div.identity-name').text + " has a ruby skill"
end
if default == false
  puts "freelancer " + driverFF.find_element(css: 'div.identity-name').text + " does not have a ruby skill"
end

if title.downcase().count("ruby") > 0 || description.downcase().count("ruby") > 0
  puts "freelancer " + driverFF.find_element(css: 'div.identity-name').text + " knows ruby"
end

driverFF.find_element(css: "p.freelancer-title strong").click
profileTitle = driverFF.find_element(xpath: '(//section[contains(@class,"up-card-section")])[7]//h2').text
if profileTitle.downcase() == title.downcase()
  puts "freelancer " + driverFF.find_element(css: 'div.identity-name').text + " profile title matches"
end

driverFF.quit


driverCH.manage.window.maximize

driverCH.navigate.to "https://www.upwork.com"
wait.until { driverCH.find_element(css: 'input[name="q"]').displayed? }
wait.until { driverCH.find_element(xpath: "//button[contains(text(),'Find Talent')]").displayed? }
driverCH.find_element(css: 'form[action="/search/profiles/"] input[type="search"]').send_keys("ruby")
driverCH.find_element(css: 'a[data-cy="menuitem-freelancers"]').click
wait.until { driverCH.find_element(xpath: "//h1[contains(text(),'Top Upwork freelancers')]").displayed? }
title = driverCH.find_element(css: "p.freelancer-title strong").text
if title.downcase().count("ruby") > 0
  puts "freelancer " + driverCH.find_element(css: 'div.identity-name').text + " knows ruby"
end

driverCH.quit
