require 'test_helper'

class SafeInvestimentControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get safe_investiment_index_url
    assert_response :success
  end

end
