describe Post do
  it { should validate_presence_of :image }

  describe "#to_param" do
    it "returns token" do
      post = Fabricate(:post)
    end
  end

  it "should generate token when created instance" do
    
  end

end