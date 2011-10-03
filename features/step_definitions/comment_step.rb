Given /^I have a comment content "([^"]*)" in the post "([^"]*)" to guest account$/ do |content, post|
  guests = User.where(:provider => "twitter", :uid => "37")
  guest = if guests.empty?
    User.create!(:provider => "twitter", :uid => "37")
  else
    guests.first
  end
  
  post = Post.where(:title => post).first
  post.comments.create!(:content => content, :user => guest)
end

Then /^I should have no comment$/ do
  Comment.count.should == 0
end