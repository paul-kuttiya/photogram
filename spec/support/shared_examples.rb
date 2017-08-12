shared_examples "redirect signed in users" do
  it "redirects signed in user" do
    user = Fabricate(:user)
    logged_in(user)
    action
    expect(response).to redirect_to user
  end
end

shared_examples "require user" do
  it "redirects non user" do
    session[:user_id] = nil
    action
    expect(response).to redirect_to login_path
  end
end