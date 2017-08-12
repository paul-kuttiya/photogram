def logged_in(user=nil)
  session[:user_id] = (user || Fabricate(:user)).id
end