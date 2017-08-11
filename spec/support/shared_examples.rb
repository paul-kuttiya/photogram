shared_examples "redirect signed in users" do
  it "redirects signed in user" do
    user = Fabricate(:user)
    signed_in(user)
    action
    expect(response).to redirect_to user
  end
end