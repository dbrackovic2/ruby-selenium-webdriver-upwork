require_relative "../pages/HomePage.rb"
require_relative "../pages/SearchProfilesPage.rb"
require_relative "../pages/ProfileSlider.rb"
require_relative "./baseTest.rb"

class TestCase < BaseTest
    @homePage
    @searchProfilesPage
    @profileSlider

    def testCase1(browser, wait, keyword)
      @homePage = HomePage.new(browser,wait)
      @homePage.waitForPageToLoad()
      @homePage.searchByKeyword(keyword)
    end

    def testCase2(browser, wait, keyword)
      @searchProfilesPage = SearchProfilesPage.new(browser,wait)
      @searchProfilesPage.waitForPageToLoad()
      @searchProfilesPage.verifyKeywordForFreelancers(keyword)
    end

    def testCase3(browser, wait)
      @profileSlider = ProfileSlider.new(browser,wait)
      @profileSlider.openFirstProfile()
      @profileSlider.verifyTitleMatchesWithTitleOnSearchProfiles()
    end

end
whichBrowser = ARGV[0]
whatKeyword = ARGV[1]
test = TestCase.new(whichBrowser)
test.testCase1(test.driver,test.wait,whatKeyword)
test.testCase2(test.driver,test.wait,whatKeyword)
test.testCase3(test.driver,test.wait)
test.teardown
