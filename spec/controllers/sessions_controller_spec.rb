describe SessionsController do
  describe "GET new" do
    it "renders new template" do
      get :new
      expect(response).to render_template :new
    end

    it_behaves_like "redirect signed in users" do
      let(:action) { get :new }
    end
  end

  describe "POST create" do
    context "valid inputs" do
      let(:user) { Fabricate(:user) }

      before do
        post :create, username: user.username, password: user.password
      end

      it "finds user from DB" do
        expect(assigns[:user]).to eq user
      end

      it "saves user session" do
        expect(session[:user_id]).not_to be_nil
      end
      
      it "flashes message" do
        expect(flash[:success]).to be_present
      end
      
      it "redirect user to user show page" do
        expect(response).to redirect_to assigns[:user]
      end
    end

    context "invalid inputs" do
      before { post :create, username: 'not_a_user', password: '1234' }
      
      it "flashes message" do
        expect(flash[:danger]).to be_present
      end
      
      it "redirect back to login page" do
        expect(response).to redirect_to login_path
      end
    end

    context "signed in user" do
      it_behaves_like "redirect signed in users" do
        let(:action) { get :new }
      end
    end
  end

  describe "GET destroy" do
    it "destroys user session" do
      get :destroy
      expect(session[:user_id]).to be_nil
    end

    it "redirect to root path" do
      get :destroy
      expect(response).to redirect_to root_path      
    end
  end
end