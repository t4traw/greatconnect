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
    
    @message = {
      content: "テストです"
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
  
  def message_user(user2)
    item_test(@item)
    click_on 'ログアウト'
    login_user2(@user2)
    visit items_url
    click_on "テストユーザー"  
  end
  
  test "visiting the show" do
    message_user(@user2)
    assert_selector "h2", text: "テストユーザーさんのページ"
  end
  
  test "create room" do
    message_user(@user2)
    click_button "メッセージを送る"
    assert_selector "h1", text: "DM（ダイレクトメッセージ）"
  end

  test "create message" do
    message_user(@user2)
    click_button "メッセージを送る"
    assert_selector "h4", text: "メッセージはまだありません"
    fill_in 'message[content]', with: @message[:content]
    click_button '送信する'
    assert_selector "strong", text: "テストです"
  end
  
  test "visiting the rooms/index" do
    login_user(@user)
    visit rooms_url
    assert_selector "h1", text: "DM一覧"
  end
  
  test "move from DM list to DM" do
    message_user(@user2)
    click_button "メッセージを送る"
    visit rooms_url
    click_on 'テストユーザーへメッセージを送る'
    assert_selector "h1", text: "DM（ダイレクトメッセージ）"
  end
  
end
