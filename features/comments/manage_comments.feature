Feature: Manage Comments
	In order to make a blog
	As an author
	I want to create and manage comments
	
	Scenario: Show Comment
 		Given I have a post titled "Hello", content "Hello World!"
		And I have a comment content "Me too!" in the post "Hello" to guest account
		When I go to the homepage
		And I follow "Hello"
		Then I should see "Me too!"
					
	Scenario: Create Valid Comment		
		Given I am logged in with guest
		Given I have a post titled "Hello", content "Hello World!"
		When I go to the homepage
		And I follow "Hello"
		And I fill in "Content" with "Me Too!"
		And I press "Create Comment"
		Then I should be on the first post page
		And I should see "Me Too!"
	
	@focus
	Scenario: Edit Valid Comment
		Given I am logged in with guest
		Given I have a post titled "Hello", content "Hello World!"
		And I have a comment content "Me too!" in the post "Hello" to guest account
		When I am on the homepage
		And I follow "Hello"
		And I follow "Edit" within ".comment-nav"
		And I fill in "Content" with "Me Three!"
		And I press "Update Comment"
		Then I should be on the first post page
		And I should see "Me Three!"
		
	Scenario: Delete Comment
		Given I am logged in with guest
		Given I have a post titled "Hello", content "Hello World!"
		And I have a comment content "Me too!" in the post "Hello" to guest account
		When I am on the homepage
		And I follow "Hello"
		And I follow "Delete" within ".comment-nav"
		Then I should be on the first post page
		And I should have no comment