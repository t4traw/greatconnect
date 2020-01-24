require "test_helper"
# require "capybara/poltergeist"

class ApplicationSystemTestCase < ActionDispatch::SystemTestCase
  driven_by :seleniu_chrome_headless, using: :chrome, screen_size: [1400, 1400]
end