require 'cucumber'
require 'capybara'
require 'capybara/cucumber'
require 'rspec'
require 'selenium-webdriver'
require_relative 'pages_helper.rb'

World(Pages)

Capybara.register_driver :selenium do |app|
    Capybara::Selenium::Driver.new(
        app,
        browser: :chrome,
        desired_capabilities: Selenium::WebDriver::Remote::Capabilities.chrome(
            'chromeOptions' => {
                'args' => ['--start-maximized']
            }
        )
    ) 
end

Capybara.configure do |config|
    config.default_driver = :selenium
    config.default_max_wait_time = 30
end