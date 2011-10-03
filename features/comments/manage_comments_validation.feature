Feature: Manage Comments with Validation
	In order to make a blog
	As an author
	I want to validate comments
	
	Scenario Outline: Create Invalid Comment
		Given I am logged in with guest
		And I have a post titled "Hello", content "Hello World!"
		When I go to the homepage
		And I follow "Hello"
		And I fill in "Content" with "<content>"
		And I press "Create Comment"
		Then I should see "<message>"
	
	Scenario Outline: Edit Inalid Comment
		Given I am logged in with guest
		And I have a post titled "Hello", content "Hello World!"
		And I have a comment content "Me too!" in the post "Hello" to guest account
		When I am on the homepage
		And I follow "Hello"
		And I follow "Edit" within ".comment-nav"
		And I fill in "Content" with "<content>"
		And I press "Update Comment"
		Then I should see "<message>"
		
	Scenarios: Failed to create comment
		|	  content 	|			  	message 				|
		| 						|	 Content can't be blank |
