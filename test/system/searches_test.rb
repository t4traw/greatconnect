require "application_system_test_case"

class SearchesTest < ApplicationSystemTestCase
  setup do
  @serch = {
    product_cont: "ABC",
    price_gteq: 100,
    price_lteq: 500
  }
  end
    

  test "whether there is a serch function" do
    item_test(@item)
    visit items_url
    assert_selector "div", text: "検索"
  end
  
  test "whether you can search" do
    item_test(@item)
    visit items_url
    fill_in 'q[product_cont]', with: @serch[:product_cont]
    fill_in 'q[price_gteq]', with: @serch[:price_gteq]
    fill_in 'q[price_lteq]', with: @serch[:price_lteq]
    click_button '検索'
    assert_no_selector "h2", text: "テストユーザー"
  end
  
  test "whether search can be cleared" do
    item_test(@item)
    visit items_url
    fill_in 'q[product_cont]', with: @serch[:product_cont]
    fill_in 'q[price_gteq]', with: @serch[:price_gteq]
    fill_in 'q[price_lteq]', with: @serch[:price_lteq]
    click_button '検索'
    click_on 'クリア'
    assert_selector "h2", text: "テストユーザー"
  end
  
end
