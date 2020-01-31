require "application_system_test_case"

class ItemsTest < ApplicationSystemTestCase
 setup do
  @item = {
     product: "テスト",
     price: 300,
     description: "テストです"
  }
 end
  
 def item_test(item)
   login_user(@user)
   click_on '投稿する'
   assert_selector "h1", text: "投稿作成"
   find("#item_image")
   attach_file "item[image]", "test/files/test.jpg"
   fill_in 'item[product]', with: item[:product]
   fill_in 'item[price]', with: item[:price]
   fill_in 'item[description]', with: item[:description]
   click_button '投稿'
 end
 
 test "visiting the new" do
   visit new_item_path
   assert_selector "h1", text: "投稿作成"
 end

 test "create item" do
   item_test(@item)
   assert_text "商品を投稿しました"
 end
 

end
