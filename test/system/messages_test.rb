require "application_system_test_case"

class MessagesTest < ApplicationSystemTestCase
  
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
