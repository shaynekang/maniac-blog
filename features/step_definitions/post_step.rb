Given /^I have a post titled "([^"]*)", content "([^"]*)"$/ do |title, content|
  Post.create!(:title => title, :content => content)
end

Then /^I should have no post$/ do
  Post.count.should == 0
end