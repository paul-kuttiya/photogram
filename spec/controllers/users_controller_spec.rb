describe UsersController do
  describe "GET new" do
    context "new user" do
      it "renders new template" do
        get :new
        expect(response).to render_template :new
      end
    end

    context "signed in user" do
      it_behaves_like "redirect signed in users" do
        let(:action) { get :new }
      end
    end
  end

  describe "POST create" do
    context "valid inputs" do
      let(:user) { Fabricate.attributes_for(:user) }

      before do
        post :create, user: user
      end

      it "creates new user instance" do
        expect(assigns[:user]).to be_instance_of User
      end

      it "stores user session" do
        expect(session[:user_id]).to be_present
      end
      
      it "save new user to DB" do
        expect(User.count).to eq 1
        expect(User.first.username).to eq user[:username]
      end
      
      it "flashes success message" do
        expect(flash[:info]).to be_present
      end

      it "redirects to user show page" do
        expect(response).to redirect_to assigns[:user]
      end
    end

    context "invalid inputs" do
      let(:user) { Fabricate.attributes_for(:user, email: nil) }
      
      before do
        post :create, user: user
      end
      
      it "renders new template" do
        expect(response).to render_template :new
      end
      
      it "contains errors message array" do
        expect(assigns[:user].errors.full_messages).not_to be_empty
      end
    end

    context "signed in user" do
      it_behaves_like "redirect signed in users" do
        let(:action) { get :new }
      end
    end
  end

  describe "GET show" do
    let(:user) { Fabricate(:user) }

    before do
      get :show, id: user[:username]
    end

    it "finds user" do
      expect(assigns[:user].username).to eq user.username
    end

    it "renders show page" do
      expect(response).to render_template :show
    end
  end

  describe "GET edit" do
    context "signed in user" do
      let(:user) { Fabricate(:user) }

      before do
        logged_in(user)
        get :edit, id: user.username
      end
      
      it "finds user" do
        expect(assigns[:user]).to eq user
      end
      
      it "render user edit page" do
        expect(response).to render_template :edit
      end
    end

    context "non user" do
      let(:user) { Fabricate(:user) }

      it_behaves_like "require user" do
        let(:action) { get :edit, id: user.username }
      end
    end
  end

  describe "POST update" do
    context "signed in user" do
      context "update profile" do
        it "finds user"
        it "redirects back to user account page"
      end

      context "update password" do
        it "finds user"
        it "redirects back to user account page"
      end     
    end

    context "non user" do
      # it_behaves_like "require user" do
      #   let(:action) { post :update, id: user.username }
      # end
    end
  end
end