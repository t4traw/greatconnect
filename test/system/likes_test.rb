require "application_system_test_case"

class LikesTest < ApplicationSystemTestCase
  
  test "like item" do
    item_test(@item)
    visit items_url
    click_on "お気に入りにする"
    assert_text 'お気に入りに登録しました'
  end
  
  test "visiting the index" do
    login_user(@user)
    visit likes_index_url
    assert_selector "h1", text: "お気に入りの投稿はありません"
  end
  
  
  test "visit the index with items" do
    item_test(@item)
    visit items_url
    click_on "お気に入りにする"
    visit likes_index_url
    assert_selector "h2", text: "テストユーザー"
  end
  
  test "undo like item" do
    item_test(@item)
    visit items_url
    click_on "お気に入りにする"
    click_on "お気に入りを取り消す"
    assert_text 'お気に入りを解除しました'
  end
  
  test "go to item index" do
    login_user(@user)
    visit likes_index_url
    assert_selector "h1", text: "お気に入りの投稿はありません"
    click_on 'マーケットへ'
  end
  
  
end
