require "application_system_test_case"

class LoginsTest < ApplicationSystemTestCase
  setup do
    @post = {
      name: "test",
      email: "test20@gmail.com",
      password: "testtest20"
    }
  end
  
  def login_user(user)
    visit root_url
    click_on 'ログインする'
    assert_selector "h1", text: "ログイン"
    fill_in 'post[email]', with: post[:email]
    fill_in 'post[password]', with: post[:password]
    click_button 'ログイン'
  end
  
  test "visiting the login" do
    visit login_url
    assert_selector "h1", text: "ログイン"
  end
  
  test "login user" do
    login_user(@post)
    visit root_url
    assert_selector "h3", test:"現在ログインユーザー：test"
  end
  
end
