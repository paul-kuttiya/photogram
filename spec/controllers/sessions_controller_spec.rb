describe SessionsController do
  describe "GET new" do
    it "renders new template"

    it_behaves_like "redirect signed in users" do
      let(:action) { get :new }
    end
  end

  describe "POST create" do
    context "valid inputs" do
      it "finds user from DB"
      it "saves user session"
      it "redirect user to user show page"
    end

    context "invalid inputs" do
      it "renders new template"
      it "has errors message array"
    end
  end
end