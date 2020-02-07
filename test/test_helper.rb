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
        #from: "東京都",
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
    #fill_in 'user[from]', with: user[:from]
    select '東京都', from: '都道府県'
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
 
  setup do
    @user2 = {
      name: "テストユーザ2",
      age: 21,
      #from: "大阪府",
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
    select '大阪府', from: '都道府県'
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

  # Add more helper methods to be used by all tests here...
end
