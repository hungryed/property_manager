# Load the Rails application.
require File.expand_path('../application', __FILE__)

# Initialize the Rails application.
PropertyManagement::Application.initialize!
config.gem "geographer", :version => '1.1.1', :source => 'http://gemcutter.org'
