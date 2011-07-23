Given /^I have a comment content "([^"]*)" in the post "([^"]*)"$/ do |content, post|
  post = Post.where(:title => post).first
  post.comments.create!(:content => content)
end

Then /^I should have no comment$/ do
  Comment.count.should == 0
end