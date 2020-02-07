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
  
  test "if the input is blank" do
    visit root_url
    click_on '登録する'
    click_button '登録'
    assert_text "名前を入力してください"
    #assert_text "都道府県を入力してください"
    assert_text "メールアドレスを入力してください"
    assert_text "年齢は数値で入力してください"
    assert_text "パスワードは不正な値です"
  end
  
  test "register if duplicate user name||email" do
    register_user(@user)
    register_user(@user)
    assert_text "メールアドレスはすでに存在します"
  end
  
  # test "when the input of prefecture is Hiragana" do
  #   visit root_url
  #   click_on '登録する'
  #   fill_in 'user[from]', with: "いわて"
  #   click_button '登録'
  #   assert_text "都道府県は不正な値です"
  # end
  
  # test "incorrect prefecture input" do
  #   visit root_url
  #   click_on '登録する'
  #   fill_in 'user[from]', with: "鹿児島県県"
  #   click_button '登録'
  #   assert_text "都道府県は4文字以内で入力してください"
  # end
  
  test "incorrect name input" do
    visit root_url
    click_on '登録する'
    fill_in 'user[name]', with: "テストテストテストテストテストテスト"
    click_button '登録'
    assert_text "名前は15文字以内で入力してください"
  end
  
  test "incorrect age input" do
    visit root_url
    click_on '登録する'
    fill_in 'user[age]', with: 999
    click_button '登録'
    assert_text "年齢は2文字以内で入力してください"
  end
  
  test "incorrect password input" do
    visit root_url
    click_on '登録する'
    fill_in 'user[password]', with: "a1"
    fill_in 'user[password_confirmation]', with: "a1"
    click_button '登録'
    assert_text "パスワードは8文字以上で入力してください"
  end
  
  test "incorrect password_confirmation input" do
    visit root_url
    click_on '登録する'
    fill_in 'user[password]', with: @user[:password]
    click_button '登録'
    assert_text "パスワード再確認とパスワードの入力が一致しません"
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