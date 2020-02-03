require "application_system_test_case"

class MessagesTest < ApplicationSystemTestCase
  
  setup do
    @user2 = {
      name: "テストユーザ2",
      age: 21,
      from: "大阪府",
      email: "test21@gmail.com",
      password: "testtest21"
    }
  end
  
  def register_user2(user2)
    visit root_url
    click_on '登録する'
    assert_selector "h1", text: "新規登録"
    fill_in 'user[name]', with: user2[:name]
    fill_in 'user[age]', with: user2[:age]
    fill_in 'user[from]', with: user2[:from]
    fill_in 'user[email]', with: user2[:email]
    fill_in 'user[password]', with: user2[:password]
    fill_in 'user[password_confirmation]', with: user2[:password]
    click_button '登録'
  end
  
  def login_user2(user2)
    register_user2(@user2)
    visit root_url
    click_on 'ログインする'
    assert_selector "h1", text: "ログイン"
    fill_in 'session[email]', with: user2[:email]
    fill_in 'session[password]', with: user2[:password]
    click_button 'ログイン'
  end
  
  test "visiting the show" do
    login_user2(@user2)
    item_test(@item)
    visit items_url
    click_on "テストユーザー"
    assert_selector "h1", text: "ユーザー詳細"
  end

  
end
