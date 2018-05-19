# Load the Rails application.
require_relative 'application'

ActionMailer::Base.delivery_method = :smtp
ActionMailer::Base.smtp_settings = {
  :user_name => 'apikey',
  :password => ENV['SENDGRID_API_KEY'],
  :domain => 'localhost',
  :address => 'smtp.sendgrid.net',
  :port => 587,
  :authentication => :plain,
  :enable_starttls_auto => true
}

# Initialize the Rails application.
Rails.application.initialize!
