require_relative "../pages/BingHomePage.rb"
require_relative "../pages/GoogleHomePage.rb"
require_relative "../pages/GoogleSearchResultsPage.rb"
require_relative "../pages/BingSearchResultsPage.rb"
require_relative "./baseTest.rb"
require_relative "../utils/assertUtil.rb"

class TestCase < BaseTest
    @googleHomePage
    @bingHomePage
    @googleSearchResultsPage
    @bingSearchResultsPage
    @googleResults
    @bingResults

    def testCase1(browser, wait)
      @googleHomePage = GoogleHomePage.new(browser,wait)  
    end

    def testCase2()
      @googleHomePage.open
    end

    def testCase3()
      @googleHomePage.waitForPageToLoad
    end

    def testCase4(keyword)
      @googleHomePage.searchByKeyword(keyword)
    end

    def testCase5(browser, wait)
      @googleSearchResultsPage = GoogleSearchResultsPage.new(browser, wait)
      @googleSearchResultsPage.waitForPageToLoad
      @googleSearchResultsPage.populateSearchResults
    end

    def testCase6(keyword)
      @googleSearchResultsPage.checkIfUrlsContainKeyword(keyword)
      @googleSearchResultsPage.checkIfTitlesContainKeyword(keyword)
      @googleSearchResultsPage.checkIfDescriptionsContainKeyword(keyword)
    end

    def testCase7(keyword)
      @googleSearchResultsPage.logSearchResults(keyword)
    end

    def testCase8(browser, wait)
      @bingHomePage = BingHomePage.new(browser, wait)
    end

    def testCase9()
      @bingHomePage.open
      @bingHomePage.waitForPageToLoad
    end

    def testCase10(keyword)
      @bingHomePage.searchByKeyword(keyword)
    end

    def testCase11(browser, wait)
      @bingSearchResultsPage = BingSearchResultsPage.new(browser, wait)
      @bingSearchResultsPage.waitForPageToLoad
      @bingSearchResultsPage.populateSearchResults
    end

    def testCase12(keyword)
      @bingSearchResultsPage.checkIfUrlsContainKeyword(keyword)
      @bingSearchResultsPage.checkIfTitlesContainKeyword(keyword)
      @bingSearchResultsPage.checkIfDescriptionsContainKeyword(keyword)
    end

    def testCase13(keyword)
      @bingSearchResultsPage.logSearchResults(keyword)
    end

    def testCase14()
      @googleResults = @googleSearchResultsPage.searchResults.results
      @bingResults = @bingSearchResultsPage.searchResults.results
      @assertUtil = AssertUtil.new
      @bingResults.each { |i|
        for j in 1..@googleResults.length() do
          if @assertUtil.verifyStringContains(i.title, @googleResults[j-1].title) == true
            puts "\e[36mTitle '#{i.title}' has been found in both search engines\e[0m"
            break
          end
        end
      }
    end

end

whichBrowser = ARGV[0]
whatKeyword = ARGV[1]
test = TestCase.new(whichBrowser)
test.testCase1(test.driver, test.wait)
test.testCase2()
test.testCase3()
test.testCase4(whatKeyword)
test.testCase5(test.driver, test.wait)
test.testCase6(whatKeyword)
test.testCase7(whatKeyword)
test.testCase8(test.driver, test.wait)
test.testCase9()
test.testCase10(whatKeyword)
test.testCase11(test.driver, test.wait)
test.testCase12(whatKeyword)
test.testCase13(whatKeyword)
test.testCase14()
test.teardown
