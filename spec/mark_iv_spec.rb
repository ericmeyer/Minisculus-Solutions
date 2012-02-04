require 'mark_iv'

describe MarkIV do
  before(:each) do
    MarkIV.keyboard = ("a".."z").to_a
  end

  it "encrypts one letter with 0,0" do
    MarkIV.new(0, 0).encrypt("a").should == "a"
  end

  it "encrypts one letter by moving it forward using the first wheel" do
    MarkIV.new(5, 0).encrypt("a").should == "f"
  end

  it "wraps around the keybaord" do
    MarkIV.new(3, 0).encrypt("y").should == "b"
  end

  it "uses the second wheel to move backwards" do
    MarkIV.new(5, 3).encrypt("f").should == "e"
  end

  it "wraps the other way" do
    MarkIV.new(5,1).encrypt("bb").should == "eg"
  end

  it "shifts the second letter based on the first" do
    MarkIV.new(5,1).encrypt("bb").should == "eg"
  end

  # it "encrypts the question 3" do
  #   plaintext = "The white cliffs of Alghero are visible at night"
  #   puts MarkIV.new(4,7).encrypt(plaintext).inspect
  # end

  it "decrypts a single charater" do
    MarkIV.new(5, 0).decrypt("f").should == "a"
  end

  it "shifts the second letter based on the first" do
    MarkIV.new(5,1).decrypt("eg").should == "bb"
  end
end

describe MarkIV, "with the real keyboard" do

  before(:each) do

  end
  it "decrypts the question 4" do
    code = "WZyDsL3u'0TfxP06RtSSF 'DbzhdyFIAu2 zF f5KE\"SOQTNA8A\"NCKPOKG5D9GSQE'M86IGFMKE6'K4pEVPK!bv83I"
    # puts MarkIV.new(7, 2).decrypt(code).inspect
  end

end