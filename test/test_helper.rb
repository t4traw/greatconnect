ENV['RAILS_ENV'] ||= 'test'
require File.expand_path('../../config/environment', __FILE__)
require 'rails/test_help'

class ActiveSupport::TestCase
  # Setup all fixtures in test/fixtures/*.yml for all tests in alphabetical order.
  fixtures :all
    setup do
    @user = {
        name: "テストユーザー",
        age: 20,
        from: "40",
        email: "test20@gmail.com",
        password: "testtest20"
    }
    
  end
  
  def register_user(user)
    visit root_url
    click_on '登録する'
    assert_selector "h1", text: "新規登録"
    fill_in 'user[name]', with: user[:name]
    fill_in 'user[age]', with: user[:age]
    fill_in 'user[from]', with: user[:from]
    fill_in 'user[email]', with: user[:email]
    fill_in 'user[password]', with: user[:password]
    fill_in 'user[password_confirmation]', with: user[:password]
    click_button '登録'
  end
  
  def login_user(user)
    register_user(@user)
    visit root_url
    click_on 'ログインする'
    assert_selector "h1", text: "ログイン"
    fill_in 'session[email]', with: user[:email]
    fill_in 'session[password]', with: user[:password]
    click_button 'ログイン'
  end
  
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
 
 def like_item(item)
   item_test(@item)
   visit items_url
   click_on "お気に入りにする"
 end

  # Add more helper methods to be used by all tests here...
end
