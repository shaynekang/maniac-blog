Feature: Manage Posts Authentication
	In order to make a blog
	As an author
	I want to authenticate post

	Scenario: Can't create a new post if you aren't admin
		When I go to the homepage
		And I should not see "New Post"

	Scenario: Can't edit the post if you aren't admin
		Given I have a post titled "Hello", content "Hello World!"
		When I go to the homepage
		And I should not see "Edit Post"
		And I should not see "Delete Post"
	
	Scenario: Can't go to the new post page directly
		When I go to the new post page
		Then I should see "Need admin role"

	Scenario: Can't go to the edit post page directly
		Given I have a post titled "Hello", content "Hello World!"
		When I go to the edit first post page
		Then I should see "Need admin role"