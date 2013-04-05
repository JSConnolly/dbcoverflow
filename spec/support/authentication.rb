include ApplicationHelper

def login(user)
  visit login_path
  fill_in "Email", :with => user.email
  fill_in "Password", :with => user.password
  find("input[type=submit]").click
end

# def logout
#   session.clear
# end