describe Post do
  it { should validate_presence_of :image }
  it { should validate_presence_of :caption }
  it { should belong_to :user }

  it "should generate token when created instance" do
    post = Fabricate.build(:post)
    post.save
    expect(post.token).to be_present  
  end

  it "should default scope by created at desc" do
    post_1 = Fabricate(:post, created_at: 4.days.ago)
    post_2 = Fabricate(:post, created_at: 1.days.ago)
    post_3 = Fabricate(:post, created_at: 3.days.ago)
    
    expect(Post.first).to eq post_2
  end

  describe "#to_param" do
    it "returns token" do
      post = Fabricate(:post)
      expect(post.token).not_to be_nil
    end
  end


end