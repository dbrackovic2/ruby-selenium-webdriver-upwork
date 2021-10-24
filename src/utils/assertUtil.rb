class AssertUtil

  def verifyStringContains(target,text)
    if target.downcase().count(text) > 0 return true
    if target.downcase().count(text) == 0 return false
  end

end
