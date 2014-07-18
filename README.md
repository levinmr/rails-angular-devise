Rails-Angular-Devise Template App
=================================

**This is a template project using Rails back-end, Devise authentication, and Angular front-end.  It also includes preconfigured testing and documentation tasks.**

**Basically all the heavy lifting of starting a new project is done and you can just start building great apps!**

The template uses rails server-side pages to authenticate the user, and then it hands control off to an angular client.  I found there was a significant amount of setup required to get this setup working as I intended, so that effort spawned the idea to provide a working template for others to adapt to their own projects.

(This has been tested on Linux only. I make no claims that it works on Windows/OSX at this time)

### Gems, Frameworks, and other libraries included:

- **Rails Backend**
    - [Rails 4.1.1](https://github.com/rails/rails)
    - [pg](http://deveiate.org/code/pg/)
        - Postgresql database
    - [Devise](https://github.com/plataformatec/devise)
        - Server side authentication library
    - [CanCan](https://github.com/ryanb/cancan)
        - Authorization
    - [Rspec](https://github.com/rspec/rspec-rails)
        - Behavior Driven Testing framework for our ruby code
    - [yard](https://github.com/lsegal/yard)
        - Ruby Documentation Tool
- **Angular Frontend**
    - [angularjs-rails](https://github.com/hiravgandhi/angularjs-rails)
    - [ng-rails-csrf](https://github.com/xrd/ng-rails-csrf)
        - This nice little gem removes the need to configure the CSRF header on API requests.
    - [angular-rails-templates](https://github.com/pitr/angular-rails-templates)
        - Auto-magically inserts your angular templates into the rails asset pipeline
    - [angular-ui-bootstrap-rails](https://github.com/cconstantin/angular-ui-bootstrap-rails)
        - Includes bootstrap directives provided by the angular-ui team
    - [teaspoon](https://github.com/modeset/teaspoon)
        - Javascript test runner.  It's set up to use jasmine and phantomJS, but can be configured to use many other testing solutions if you prefer.
    - [jsdoc](https://github.com/jsdoc3/jsdoc)
        - JavaScript Documentation Tool
- **Common Items**
    - [Bootstrap-sass](https://github.com/twbs/bootstrap-sass)
        - Bootstrap 3 css with SASS support
    - [simplecov](https://github.com/colszowka/simplecov)
        - Metrics

### What you get preconfigured:

- Ruby on Rails app and directory structure
- Angular app and directory structure
- Rails User model
- Server side Sign-in/Registration
- Rails hand off to Angular on sign-in
- Angular asset pipeline integration
- Ruby and JavaScript testing environments
- Ruby and JavaScript code coverage
- Travis CI build info
- Yard documentation for Ruby
- JSDoc documentation for JavaScript
- Rubocop and JSHint config files

### Requirements:

- Ruby 2.1 installed (Should work with ruby versions > 1.9.3, but I recommend the latest)
- Postgres database installed and configured

#### Optional other dependencies
- [Istanbul](https://github.com/gotwarlost/istanbul) for javascript code coverage report

### Initial Setup:

- Clone the repo
- In config/application.rb, change config.app_name to your project's name (This name is used on login pages and page titles)
- <code>bundle install</code> to install all the required gems

### Database Creation:

- Add your DB connection details in config/database.yml (Not provided in repo -- You should never check your database info into source control!)
- <code>bundle exec rake db:create</code>

### Database Initialization:

- <code>bundle exec rake db:migrate</code>

### Running Tests

- Ruby tests: <code>bundle exec rspec</code>
- Javascript tests: <code>bundle exec teaspoon</code>
- Code coverage reports are generated automatically with each of the above commands
    - Coverage reports are located in spec/coverage
    - Istanbul node package is required for JS coverage report

### Continuous Integration

- Set up your repository to be watched by [TravisCI](https://travis-ci.org/) and your build and tests will be run automatically by travis with every push.  Travis config file is included and set up with the standard build info and test suite commands

### Generating Documentation

- <code>bundle exec rake mydoc</code>

### Development FAQs

- **Where is the angular code?**
    - app/assets/javascripts has the scripts and folder structure for the angular app
    - app/assets/templates has the HTML templates.  See [angular-rails-templates](https://github.com/pitr/angular-rails-templates) for details on how to reference the templates.
- **Where is index.html for my angular app?**
    - The layout template is in: app/views/layouts/angular.html.erb
    - The index page is in: app/views/home/index.html.erb
