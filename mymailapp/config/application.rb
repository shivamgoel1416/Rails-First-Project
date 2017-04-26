require_relative 'boot'

require 'rails/all'

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module Mymailapp
  class Application < Rails::Application

    ActionMailer::Base.smtp_settings = {
      :address => 'smtp.mandrillapp.com',
      :port => 587,
      :user_name => "shivamgoel1008@gmail.com",
      :password => "08511fa20498386ad086f134da5b164c-us15",
      :authentication => :plain,
    }
  end
end
