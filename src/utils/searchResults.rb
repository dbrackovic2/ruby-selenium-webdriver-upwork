require "selenium-webdriver"
require_relative "./searchResult.rb"

class SearchResults
    attr_accessor :results
    attr_accessor  :urls
    attr_accessor :titles 
    attr_accessor :descriptions
    @results
    @urls
    @titles
    @descriptions

    def initialize(u, t, d)
        @urls = u
        @titles = t
        @descriptions = d
        @results = Array.new(u.length())
        puts "\e[34mThere are #{@results.length()} results\e[0m"
        puts "\e[32mThese are elements with urls: #{@urls}\e[0m"
        puts "\e[34mThese are elements with titles: #{@titles}\e[0m"
        for i in 1..@results.length() do
            if d.include?(i-1)
                @results[i-1] = SearchResult.new(u[i-1].attribute("href").downcase(), t[i-1].text().downcase(), d[i-1].text().downcase())
            else
                @results[i-1] = SearchResult.new(u[i-1].attribute("href").downcase(), t[i-1].text().downcase(), '')
            end
        end
    end

    def checkIfUrlsContainKeyword(keyword)
        default = false
        @urls.each { |i|
           if i.attribute("href").downcase().count(keyword) > 0
            default = true
           end
        }
        return default;
    end

    def checkIfTitlesContainKeyword(keyword)
        default = false
        @titles.each { |i|
           if i.text().downcase().count(keyword) > 0
            default = true
           end
        }
        return default;
    end
    
    def checkIfDescriptionsContainKeyword(keyword)
        default = false
        @descriptions.each { |i|
           if i.text().downcase().count(keyword) > 0
            default = true
           end
        }
        return default;
    end

    def logWhatSearchResultsContainOrNotContainKeyword(keyword)
        @results.each { |i|
            i.checkIfSearchResultContainsKeyword(keyword)
        }
    end
end
