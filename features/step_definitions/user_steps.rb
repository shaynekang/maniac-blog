Given /^I have a user provided "([^"]*)", uid "([^"]*)"$/ do |provider, uid|
  User.create!(:provider => provider, :uid => uid)
end

Given /^I am logged in with admin$/ do
  User.create!(:provider => "twitter", :uid => "37", :admin => true)
	Given 'I am on the homepage'
  Given 'I follow "Sign in"'
	Given 'I follow "Twitter"'
end

Given /^I am logged in with guest$/ do
  User.create!(:provider => "twitter", :uid => "37", :admin => false)
  Given 'I am on the homepage'
  Given 'I follow "Sign in"'
	Given 'I follow "Twitter"'
end