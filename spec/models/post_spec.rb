describe Post do
  it { should validate_presence_of :image }
  it { should use_before_action(:generate_token) }

  describe "#to_param" do
    it "returns token" do
      # post = Fabricate(:post)
      
    end
  end

  it "should generate token when created instance" do
    
  end

end