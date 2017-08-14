describe PostsController do
  describe "GET new" do
    it_behaves_like "require user" do
      let(:action) do
         get :new, user_id: Fabricate(:user).username
      end
    end

    it "should render new template" do
      logged_in
      get :new, user_id: Fabricate(:user).username
      expect(response).to render_template :new
    end
  end

  describe "POST create" do
    describe "non user" do
      it_behaves_like "require user" do
        let(:action) do
          post :create, 
          user_id: Fabricate(:user).username, 
          post: Fabricate.attributes_for(:post)
        end
      end
    end

    describe "user" do
      context "valid inputs" do
        let(:user) { Fabricate(:user, username: "abcde") }
        let(:file) { fixture_file_upload('files/pic_1.jpeg', 'image/jpeg') }
        let(:user_post) { Fabricate.attributes_for(:post, user: user) }

        before do
          logged_in(user)
          user_post["image"] = file  

          post :create, user_id: user.username, post: user_post
        end
        
        it "creates new post instance" do
          expect(assigns[:post]).to be_instance_of Post
        end
        
        it "saves post to DB" do
          expect(Post.count).to eq 1
        end
        
        it "redirects to user post page" do
          expect(response).to redirect_to [user, assigns[:post]]
        end
      end  
      
      context "invalid inputs" do
        let(:user) { Fabricate(:user) }
        let(:user_post) { Fabricate.attributes_for(:post, user: user, image: nil, caption: nil) }

        before do
          logged_in(user)
          post :create, user_id: user.username, post: user_post
        end
        
        it "does not save post to DB" do
          expect(Post.count).to eq 0
        end

        it "renders new template" do
          expect(response).to render_template :new
        end
        
        it "contains error array" do
          expect(assigns[:post].errors.messages).not_to be_empty
        end
      end
      
      
    end
  end
end