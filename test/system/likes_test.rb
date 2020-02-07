require "application_system_test_case"

class LikesTest < ApplicationSystemTestCase
  
  test "like item" do
    like_item(@item)
    assert_text 'お気に入りに登録しました'
  end
  
  test "undo like item" do
    like_item(@item)
    click_on "お気に入りを取り消す"
    assert_text 'お気に入りを解除しました'
  end
  
  test "visiting the index" do
    login_user(@user)
    visit likes_index_url
    assert_selector "h1", text: "お気に入りの投稿はありません"
  end
  
  test "visit the index with items" do
    like_item(@item)
    visit likes_index_url
    assert_selector "h2", text: "テストユーザー"
  end
  
  test "go to item index" do
    item_test(@item)
    visit likes_index_url
    click_on 'マーケットへ'
    assert_selector "h2", text: "テストユーザー"
  end
  
  test "undo likes from the likes list" do
    like_item(@item)
    visit likes_index_url
    click_on 'お気に入りを取り消す'
    assert_text 'お気に入りを解除しました'
  end
  
  test "can you go to user/show" do
    item_test(@item)
    click_on 'ログアウト'
    login_user2(@user2)
    visit items_url
    click_on 'お気に入りにする'
    visit likes_index_url
    click_on "DMを送る"
    assert_selector "h2", text: "テストユーザーさんのページ"
  end
  
end
