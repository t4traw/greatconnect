require "application_system_test_case"

class UsersTest < ApplicationSystemTestCase
  setup do
    @user = {
        name: "テストユーザー",
        age: 20,
        from: "東京都",
        email: "test20@gmail.com",
        password: "testtest20",
        password_confirmation: "testtest20"
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
    fill_in 'user[password_confirmation]', with: user[:password_confirmation]
    click_button '登録'
  end
  
  test "visiting the new" do
    visit new_user_url
    assert_selector "h1", text: "新規登録"
  end
  
  test "create user" do
    register_user(@user)
    assert_text "登録が完了しました"
  end
  
  test "register if duplicate user name||email" do
    register_user(@user)
    register_user(@user)
    assert_text "メールアドレスはすでに存在します"
  end
  

end