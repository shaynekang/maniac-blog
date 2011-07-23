Feature: Manage Posts with Validation
	In order to make a blog
	As an author
	I want to validate posts
	
	@omniauth	
	Scenario Outline: Create Invalid Post
		Given I am logged in with admin
 		And I am on the homepage
		When I follow "New Post"
		And I fill in "Title" with "<title>"
		And I fill in "Content" with "<content>"
		And I press "Create Post"
		Then I should see "<message>"
		
	@omniauth
	Scenario Outline: Edit Invalid Post
		Given I am logged in with admin
		And I have a post titled "Hello", content "Hello World!"
		When I am on the homepage
		And I follow "Edit Post"
		And I fill in "Title" with "<title>"
		And I fill in "Content" with "<content>"
		And I press "Update Post"
		Then I should see "<message>"
		
	Scenarios: Failed to create post
		| title |	  content 	|			  	message 				|
		|				| Hello World |	 Title can't be blank 	|
		|	Hello	| 						|	 Content can't be blank |
		