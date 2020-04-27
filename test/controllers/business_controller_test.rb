require 'test_helper'

class BusinessControllerTest < ActionDispatch::IntegrationTest
  test "should get show" do
    get business_show_url
    assert_response :success
  end

end
