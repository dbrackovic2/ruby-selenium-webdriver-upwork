class TestConfig
  @GOOGLE_URL
  @BING_URL
  def initialize()
    @GOOGLE_URL = 'https://www.google.com'
    @BING_URL = 'https://www.bing.com'
  end
  def getGoogleUrl
    return @GOOGLE_URL
  end
  def getBingUrl
    return @BING_URL
  end
end
