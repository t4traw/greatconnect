require "application_system_test_case"

class CommentsTest < ApplicationSystemTestCase
  
  setup do
    @comment = {
      content: "コメントのテストです。"
    }
  end
  
  def comment_item(comment)
    item_test(@item)
    visit items_url 
    click_on "コメントする"
    assert_selector "h1", text: "コメントの投稿"
    fill_in "comment[content]", with: @comment[:content]
    click_button 'コメントする'
  end
  
  test "comment the item" do
    comment_item(@comment)
    assert_text 'コメントしました'
  end
  
  test "comments fail" do
    item_test(@item)
    visit items_url 
    click_on "コメントする"
    assert_selector "h1", text: "コメントの投稿"
    click_button 'コメントする'
    assert_text 'コメントに失敗しました'
  end
  
  test "there are comments on index" do
    comment_item(@comment)
    visit items_url
    assert_selector "p", text: "コメントのテストです"
  end
  
  test "comment from user.index" do
    item_test(@item)
    visit users_url
    click_on 'コメントする'
    assert_selector "h1", text: "コメントの投稿"
    fill_in "comment[content]", with: @comment[:content]
    click_button 'コメントする'
    assert_text 'コメントしました'
  end
  
  test "comment from like.index" do
    like_item(@item)
    visit likes_index_url
    click_on 'コメントする'
    assert_selector "h1", text: "コメントの投稿"
    fill_in "comment[content]", with: @comment[:content]
    click_button 'コメントする'
    assert_text 'コメントしました'
  end
  
  
end
