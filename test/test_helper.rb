ENV['RAILS_ENV'] ||= 'test'
require File.expand_path('../../config/environment', __FILE__)
require 'rails/test_help'

class ActiveSupport::TestCase
  # Setup all fixtures in test/fixtures/*.yml for all tests in alphabetical order.
  fixtures :all
    setup do
    @user = {
        name: "テストユーザー",
        age: 20,
        from: "東京都",
        email: "test20@gmail.com",
        password: "testtest20"
    }
  end
  
  def register_user(user)
    visit root_url
    click_on '登録する'
    assert_selector "h1", text: "新規登録"
    fill_in 'user[name]', with: user[:name]
    fill_in 'user[age]', with: user[:age]
    fill_in 'user[from]', with: user[:from]
    fill_in 'user[email]', with: user[:email]
    fill_in 'user[password]', with: user[:password]
    fill_in 'user[password_confirmation]', with: user[:password]
    click_button '登録'
  end
  
  def login_user(user)
    register_user(@user)
    visit root_url
    click_on 'ログインする'
    assert_selector "h1", text: "ログイン"
    fill_in 'session[email]', with: user[:email]
    fill_in 'session[password]', with: user[:password]
    click_button 'ログイン'
  end

  # Add more helper methods to be used by all tests here...
end
