require 'test_helper'

class ChartsControllerControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get charts_controller_index_url
    assert_response :success
  end

end
