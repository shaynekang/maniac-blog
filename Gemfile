source 'http://rubygems.org'

gem 'rails', '3.1.0'

# Asset template engines
# Gems used only for assets and not required
# in production environments by default.
group :assets do
  gem 'sass-rails', "~> 3.1.0"
  gem 'coffee-rails', "~> 3.1.0"
  gem 'uglifier'
end

gem 'slim'
gem 'jquery-rails'
gem 'json'

gem 'omniauth', :git => "git://github.com/intridea/omniauth.git"
gem 'decent_exposure'
gem 'kaminari'

gem 'redcarpet'
gem 'albino'
gem 'nokogiri', "1.5.0"

gem 'rails-i18n'

gem 'dynamic_form'

group :development, :test do
	# gem 'ruby-debug'

	gem 'sqlite3'
	
	gem 'rspec-rails'
	gem 'cucumber-rails'
	gem 'capybara'
	gem 'database_cleaner'

	gem 'guard'
	gem 'guard-rspec'
	gem 'guard-livereload'
	gem 'rb-fsevent'
	gem 'growl'

	gem 'autotest-rails'
	gem 'autotest-fsevent'
	gem 'autotest-growl'
	gem 'shoulda'
	
	gem 'factory_girl_rails'
end

group :production do
	gem 'pg'
end