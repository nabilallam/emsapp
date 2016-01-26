# This file is copied to spec/ when you run 'rails generate rspec:install'
#ENV["RAILS_ENV"] ||= 'test'
#require File.expand_path("../../config/environment", __FILE__)
#require 'rspec/rails'
##require 'spec_helper'

## Requires supporting ruby files with custom matchers and macros, etc, in
## spec/support/ and its subdirectories. Files matching `spec/**/*_spec.rb` are
## run as spec files by default. This means that files in spec/support that end
## in _spec.rb will both be required and run as specs, causing the specs to be
## run twice. It is recommended that you do not name files matching this glob to
## end with _spec.rb. You can configure this pattern with the --pattern
## option on the command line or in ~/.rspec, .rspec or `.rspec-local`.
#Dir[Rails.root.join("spec/support/**/*.rb")].each { |f| require f }

## Checks for pending migrations before tests are run.
## If you are not using ActiveRecord, you can remove this line.
#ActiveRecord::Migration.maintain_test_schema!

#RSpec.configure do |config|
  ##File-type inference based on their location
  ##  #should be discussed if we add to every spec-file the type attribute e.g. type: :controller.
  #config.infer_spec_type_from_file_location!
  ## == Mock Framework
  ## If you prefer to use mocha, flexmock or RR, uncomment the appropriate line:
  ##
  ## config.mock_with :mocha
  ## config.mock_with :flexmock
  ## config.mock_with :rr
  #config.mock_with :rspec
    #config.mock_with :rspec

  ##It is needed to to be able to use the get method in feature tests
  #config.include RSpec::Rails::RequestExampleGroup, type: :feature

  #config.include Devise::TestHelpers, type: :controller

  ## If you're not using ActiveRecord, or you'd prefer not to run each of your
  ## examples within a transaction, remove the following line or assign false
  ## instead of true.
  #config.use_transactional_fixtures = true

  ## RSpec Rails can automatically mix in different behaviours to your tests
  ## based on their file location, for example enabling you to call `get` and
  ## `post` in specs under `spec/controllers`.
  ##
  ## You can disable this behaviour by removing the line below, and instead
  ## explicitly tag your specs with their type, e.g.:
  ##
  ##     RSpec.describe UsersController, :type => :controller do
  ##       # ...
  ##     end
  ##
  ## The different available types are documented in the features, such as in
  ## https://relishapp.com/rspec/rspec-rails/docs
  #config.infer_spec_type_from_file_location!
#end
