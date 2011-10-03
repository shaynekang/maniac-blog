Feature: Manage Users
	In order to make a blog
	As an author
	I want to signup, signin and signout with user account
	
	Scenario Outline: Sign Up
		Given I am on the homepage
		And I follow "Sign in"
		And I follow "<provider>"
		Then I should see "Successfully Signed in!"
		And I should be on the homepage

	Scenario Outline: Sign In
		Given I have a user provided "twitter", uid "37"
		And I am on the homepage
		And I follow "Sign in"
		And I follow "<provider>"
		Then I should see "Successfully Signed in!"
		And I should be on the homepage		

	Scenario Outline: Sign Out
		And I am on the homepage
		And I follow "Sign in"
		And I follow "<provider>"
		And I follow "Sign out"
		Then I should see "Successfully Signed out!"
		And I should be on the homepage
		
	Scenarios: with OAuth API
		| provider |
		| Twitter  |