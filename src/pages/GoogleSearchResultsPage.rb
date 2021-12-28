require "selenium-webdriver"
require_relative "../utils/searchResults.rb"

class GoogleSearchResultsPage
    attr_accessor :searchResults
    GOOGLE_BACK_TO_HOME_BTN = { css: 'form[role="search"] a[href*="https://www.google.com"]'}
    GOOGLE_SEARCH_RESULTS = { css: 'div[role="main"] h3'}
    URLS = { xpath: "//h3/parent::a" }
    DESCRIPTIONS = { xpath: "//h3/parent::a/parent::div/following-sibling::div/div[@style='-webkit-line-clamp:2']" }
    @driver
    @wait
    @searchResults
    
    def initialize(driver, wait)
        @driver = driver
        @wait = wait
    end

    def waitForPageToLoad
        @wait.until { @driver.find_element(GOOGLE_BACK_TO_HOME_BTN).displayed? }
        @wait.until { @driver.find_element(GOOGLE_SEARCH_RESULTS).displayed? }
        puts "Google search results page loaded."
    end

    def populateSearchResults
        @searchResults = SearchResults.new(@driver.find_elements(URLS), @driver.find_elements(GOOGLE_SEARCH_RESULTS), @driver.find_elements(DESCRIPTIONS))
        @searchResults.urls.each { |i|
            puts "Title #{i.attribute("href")}"
        }
    end

    def checkIfUrlsContainKeyword(keyword)
        contains = @searchResults.checkIfUrlsContainKeyword(keyword)
        if contains == false
            puts "\e[31mThere is an url that doesn't contain #{keyword}\e[0m"
        end
    end

    def checkIfTitlesContainKeyword(keyword)
        contains = @searchResults.checkIfTitlesContainKeyword(keyword)
        if contains == false
            puts "\e[31mThere is a title that doesn't contain #{keyword}\e[0m"
        end
    end
    
    def checkIfDescriptionsContainKeyword(keyword)
        contains = @searchResults.checkIfDescriptionsContainKeyword(keyword)
        if contains == false
            puts "\e[31mThere is a description that doesn't contain #{keyword}"
        end
    end 

    def logSearchResults(keyword)
        @searchResults.logWhatSearchResultsContainOrNotContainKeyword(keyword)
        puts "Logging finished for Google search engine"
    end
end