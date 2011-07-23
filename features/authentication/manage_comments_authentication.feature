Feature: Manage Comments Authentication
	In order to make a blog
	As an author
	I want to authenticate comment

	Scenario: Can't create a new comment if you aren't log in
		Given I have a post titled "Hello", content "Hello World!"
		When I go to the homepage
		Then I should not see the button "Create Comment"