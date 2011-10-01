Given /^I have a comment content "([^"]*)" in the post "([^"]*)" to guest account$/ do |content, post|
  guest = User.create!(:provider => "twitter", :uid => "37")
  post = Post.where(:title => post).first
  post.comments.create!(:content => content, :user => guest)
end

Then /^I should have no comment$/ do
  Comment.count.should == 0
end