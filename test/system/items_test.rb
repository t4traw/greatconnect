require "application_system_test_case"

class ItemsTest < ApplicationSystemTestCase
 
 setup do
 @item2 = {
   product: "テスト編集",
   price: 500,
   description: "テスト編集です"
 }
 end
 
 test "visiting the new" do
   visit new_item_url
   assert_selector "h1", text: "投稿作成"
 end
 
 test "visiting the show" do
   item_test(@item)
   visit items_url
   click_on '詳細をみる'
   assert_selector "h2",text:"テストユーザー"
 end
 
 test "Move from show to index" do
   item_test(@item)
   visit items_url
   click_on '詳細をみる'
   click_on '<= 一覧に戻る'
   assert_selector "h2", text: "テストユーザー"
 end

 test "create item" do
   item_test(@item)
   assert_text "商品を投稿しました"
 end
 
 test "if the input is blank" do
   login_user(@user)
   click_on '投稿する'
   click_button '投稿'
   assert_text "画像を入力してください"
   assert_text "商品の説明を入力してください"
   assert_text "価格は数値で入力してください"
   assert_text "商品の説明を入力してください"
 end
 
 test "wrong price" do
   login_user(@user)
   click_on '投稿する'
   fill_in 'item[price]', with: 100000000
   click_button '投稿'
   assert_text "価格は8文字以内で入力してください"
 end
 
 test "visiting the index" do
   item_test(@item)
   visit items_url
   assert_selector "h2", text: "テストユーザー"
 end
 
 test "edit item" do
   item_test(@item)
   visit users_url
   click_on "編集"
   assert_selector "h1", text: "投稿の編集"
   find("#edit_item_image")
   attach_file "item[image]", "test/files/edit_test.jpg"
   fill_in 'item[product]', with: @item2[:product]
   fill_in 'item[price]', with: @item2[:price]
   fill_in 'item[description]', with: @item2[:description]
   click_button '編集する'
 end
 
 test "deleting item" do
   item_test(@item)
   visit users_url
   click_on "削除"
   assert_text '投稿を削除しました'
 end
 
 test "Can pagination be possible" do
   item_test(@item)
   click_on '投稿する'
   assert_selector "h1", text: "投稿作成"
   find("#item_image")
   attach_file "item[image]", "test/files/test.jpg"
   fill_in 'item[product]', with: @item[:product]
   fill_in 'item[price]', with: @item[:price]
   fill_in 'item[description]', with: @item[:description]
   click_button '投稿'
   click_on '投稿する'
   assert_selector "h1", text: "投稿作成"
   find("#item_image")
   attach_file "item[image]", "test/files/test.jpg"
   fill_in 'item[product]', with: @item[:product]
   fill_in 'item[price]', with: @item[:price]
   fill_in 'item[description]', with: @item[:description]
   click_button '投稿'
   click_on '投稿する'
   assert_selector "h1", text: "投稿作成"
   find("#item_image")
   attach_file "item[image]", "test/files/test.jpg"
   fill_in 'item[product]', with: @item[:product]
   fill_in 'item[price]', with: @item[:price]
   fill_in 'item[description]', with: @item[:description]
   click_button '投稿'
   click_on '投稿する'
   assert_selector "h1", text: "投稿作成"
   find("#item_image")
   attach_file "item[image]", "test/files/test.jpg"
   fill_in 'item[product]', with: @item[:product]
   fill_in 'item[price]', with: @item[:price]
   fill_in 'item[description]', with: @item[:description]
   click_button '投稿'
   click_on '投稿する'
   assert_selector "h1", text: "投稿作成"
   find("#item_image")
   attach_file "item[image]", "test/files/test.jpg"
   fill_in 'item[product]', with: @item[:product]
   fill_in 'item[price]', with: @item[:price]
   fill_in 'item[description]', with: @item[:description]
   click_button '投稿'
   click_on '投稿する'
   assert_selector "h1", text: "投稿作成"
   find("#item_image")
   attach_file "item[image]", "test/files/test.jpg"
   fill_in 'item[product]', with: @item[:product]
   fill_in 'item[price]', with: @item[:price]
   fill_in 'item[description]', with: @item[:description]
   click_button '投稿'
   click_on '投稿する'
   assert_selector "h1", text: "投稿作成"
   find("#item_image")
   attach_file "item[image]", "test/files/test.jpg"
   fill_in 'item[product]', with: @item[:product]
   fill_in 'item[price]', with: @item[:price]
   fill_in 'item[description]', with: @item[:description]
   click_button '投稿'
   visit items_url
   click_on '最後'
   assert_selector "h2", text: "テストユーザー"
 end
 
 test "can you go to user/show" do
   item_test(@item)
   click_on 'ログアウト'
   login_user2(@user2)
   visit items_url
   click_on '詳細をみる'
   click_on "DMを送る"
   assert_selector "h2", text: "テストユーザーさんのページ"
 end
 
end
