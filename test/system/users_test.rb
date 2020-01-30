require "application_system_test_case"

class UsersTest < ApplicationSystemTestCase
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