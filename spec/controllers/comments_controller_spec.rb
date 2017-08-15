describe CommentsController do
  describe "POST create" do
    it "saves comment for user" do
      user = Fabricate(:user)
      logged_in(user)

      post :create, 
      user_id: user.username, 
      id: Fabricate(:post).token,
      description: "test comment"

      expect(Comment.count).to eq 1
    end

    it "redirects to login page for non user" do
      user = Fabricate(:user)
      
      post :create, 
      user_id: user.username, 
      id: Fabricate(:post).token,
      description: "test comment"

      expect(response).to redirect_to login_path
    end
  end
end 