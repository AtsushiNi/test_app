require 'redis'
# Load the Rails application.
require_relative 'application'

# Initialize the Rails application.
Rails.application.initialize!
ENV["REDIS"] = "https://192.162.33.11:3000"
