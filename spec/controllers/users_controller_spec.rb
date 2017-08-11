describe UsersController do
  describe "GET new" do
    it "renders new template" do
      get :new
      expect(response).to render_template :new
    end
  end

  describe "POST create" do
    context "valid inputs" do
      it "creates new user instance"
      it "save new user to DB"
      it "redirects to user show page"
    end

    context "invalid inputs" do
      it "renders new template"
      it "contains errors message array"
    end
  end

  describe "GET show" do
    it "renders show page"
  end

  describe "GET edit" do
    context "signed in user" do
      it "finds user"
      it "renders user edit page"
    end

    context "non user" do
      it "redirects to sign in path"
    end
  end

  describe "POST update" do
    context "signed in user" do
      it "finds user"
      it "updates user info"
      it "redirects back to user show page"
    end

    context "non user" do
      it "redirects to sign in path"
    end
  end
end