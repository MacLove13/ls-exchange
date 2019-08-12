require 'test_helper'

class QuotesControllerTest < ActionDispatch::IntegrationTest
  test "should get buy_quote" do
    get quotes_buy_quote_url
    assert_response :success
  end

end
