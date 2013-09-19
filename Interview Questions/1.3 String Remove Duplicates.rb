class String
  def dedupe
    
  end
end

def test
  "aabbcc".dedupe == "abc"
  "112233".dedupe == "123"
  "abacabac".dedupe == "abc"
  " $ a A 111 ".dedupe == " $aA1"
  "".dedupe == ""
  "abc".dedupe == "abc"
end

test