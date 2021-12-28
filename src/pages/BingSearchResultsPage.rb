require "selenium-webdriver"
require_relative "../utils/searchResults.rb"

class BingSearchResultsPage
    attr_accessor :searchResults
    BING_BACK_TO_HOME_BTN = { css: 'h1.b_logo' }
    BING_SEARCH_RESULTS = { css: 'h2:not([class])'}
    URLS = { css: 'h2:not([class]) a'}
    DESCRIPTIONS = { css: 'h2:not([class]) + div p'}
    @driver
    @wait
    @searchResults
    
    def initialize(driver, wait)
        @driver = driver
        @wait = wait
    end

    def waitForPageToLoad
        @wait.until { @driver.find_element(BING_BACK_TO_HOME_BTN).displayed? }
        @wait.until { @driver.find_element(BING_SEARCH_RESULTS).displayed? }
        puts "Bing search results page loaded."
    end

    def populateSearchResults
        @searchResults = SearchResults.new(@driver.find_elements(URLS), @driver.find_elements(BING_SEARCH_RESULTS), @driver.find_elements(DESCRIPTIONS))
        @searchResults.urls.each { |i|
            puts "Title #{i.attribute("href")}"
        }
    end

    def checkIfUrlsContainKeyword(keyword)
        contains = @searchResults.checkIfUrlsContainKeyword(keyword)
        if contains == false
            puts "There is an url that doesn't contain #{keyword}"
        end
    end

    def checkIfTitlesContainKeyword(keyword)
        contains = @searchResults.checkIfTitlesContainKeyword(keyword)
        if contains == false
            puts "There is a title that doesn't contain #{keyword}"
        end
    end
    
    def checkIfDescriptionsContainKeyword(keyword)
        contains = @searchResults.checkIfDescriptionsContainKeyword(keyword)
        if contains == false
            puts "There is a description that doesn't contain #{keyword}"
        end
    end 

    def logSearchResults(keyword)
        @searchResults.logWhatSearchResultsContainOrNotContainKeyword(keyword)
        puts "Logging finished for bing search engine"
    end
end