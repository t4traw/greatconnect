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
  
  test "visiting the index" do
    login_user(@user)
    visit users_url
    assert_selector "h1", text: "現在あなたの投稿はありません"
  end
  
  test "visit the index with items" do
    item_test(@item)
    visit users_url
    assert_selector "h2", text: "テストユーザー"
  end
  
  test "go to item new" do
    login_user(@user)
    visit users_url
    assert_selector "h1", text: "現在あなたの投稿はありません"
    click_on '投稿を作成する'
  end

end