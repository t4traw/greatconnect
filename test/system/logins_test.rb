require "application_system_test_case"

class LoginsTest < ApplicationSystemTestCase
  
  test "visiting the login" do
    visit login_url
    assert_selector "h1", text: "ログイン"
  end
  
  test "login user" do
    login_user(@user)
    visit root_url
    page.save_screenshot "tmp/screenshots/#{Time.now.strftime('%Y%m%d%H%M%S')}.png"
    assert_selector "h3", text: "現在ログインユーザー：テストユーザー"

  end

end