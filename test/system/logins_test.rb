require "application_system_test_case"

class LoginsTest < ApplicationSystemTestCase
  
  test "visiting the login" do
    visit login_url
    assert_selector "h1", text: "ログイン"
  end
  
  test "login user" do
    login_user(@user)
    assert_text 'ログインしました'
    visit root_url
    assert_selector "h3", text: "現在ログインユーザー：テストユーザー"
  end
  
  test "ligout user" do
    login_user(@user)
    click_on 'ログアウト'
    assert_text 'ログアウトしました'
  end

end