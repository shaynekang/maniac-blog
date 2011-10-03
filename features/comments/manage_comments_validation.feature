Feature: Manage Comments with Validation
	In order to make a blog
	As an author
	I want to validate comments
	
	Scenario Outline: Create Invalid Comment
		Given I am logged in with guest
		Given I have a post titled "Hello", content "Hello World!"
		When I go to the homepage
		And I follow "Hello"
		And I fill in "Content" with "<content>"
		And I press "Create Comment"
		Then I should see "<message>"
		
	Scenarios: Failed to create comment
		|	  content 	|			  	message 				|
		| 						|	 Content can't be blank |
