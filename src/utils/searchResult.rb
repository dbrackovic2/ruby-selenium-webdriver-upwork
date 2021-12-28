require "selenium-webdriver"
require_relative "./assertUtil.rb"

class SearchResult
    attr_accessor :title
    @assertUtil
    @containsKeyword
    @url
    @title
    @description

    def initialize(u, t, d = '')
        @url = u
        @title = t
        @description = d
        @containsKeyword = false
        @assertUtil = AssertUtil.new
    end

    def checkIfSearchResultContainsKeyword(keyword)
        if (@assertUtil.verifyStringContains(@url, keyword) || @assertUtil.verifyStringContains(@title, keyword) || @assertUtil.verifyStringContains(@description, keyword))
            @containsKeyword = true
        end
        if @containsKeyword == true
            puts "\e[35m'#{@title}' search result contains keyword '#{keyword}'\e[0m"
        else
            puts "\e[31m'#{@title} search result does not contain keyword #{keyword}'\e[0m"
        end
    end
end
