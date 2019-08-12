require 'test_helper'

class QuoteControllerTest < ActionDispatch::IntegrationTest
  test "should get buy" do
    get quote_buy_url
    assert_response :success
  end

end
