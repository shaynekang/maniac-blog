Feature: Manage Posts
	In order to make a blog
	As an author
	I want to create and manage posts
	
	Scenario: Posts List
		Given I have a post titled "First Post", content "Hello!"
		Given I have a post titled "Second Post", content "Bye!"
		When I go to the homepage
		Then I should see "Second Post"
		When I follow "Next"
		Then I should see "First Post"
		
	Scenario: Show Post
		Given I have a post titled "Hello", content "Hello World!"
		When I go to the homepage
		And I follow "Hello"
		Then I should see "Hello"
		Then I should see "Hello World"
			
	@omniauth
	Scenario: Create Valid Post
		Given I am logged in with admin
		When I go to the homepage
		And I follow "New Post"
		And I fill in "Title" with "Hello"
		And I fill in "Content" with "Hello World!"
		And I press "Create Post"
		Then I should be on the homepage
		And I should see "Hello"
		And I should see "Hello World"

	@omniauth	
	Scenario: Edit Valid Post
		Given I am logged in with admin
		And I have a post titled "Hello", content "Hello World!"
		When I go to the homepage
		And I follow "Edit" within ".post-nav"
		And I fill in "Title" with "Bye"
		And I fill in "Content" with "Goodbye World!"
		And I press "Update Post"
		Then I should be on the first post page
		And I should see "Bye"
		And I should see "Goodbye World!"
		
	@omniauth
	Scenario: Delete Post
		Given I am logged in with admin
		And I have a post titled "Hello", content "Hello World!"
		When I am on the homepage
		And I follow "Delete" within ".post-nav"
		Then I should be on the homepage
		And I should have no post