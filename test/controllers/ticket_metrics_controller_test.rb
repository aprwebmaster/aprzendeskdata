require 'test_helper'

class TicketMetricsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get ticket_metrics_index_url
    assert_response :success
  end

  test "should get show" do
    get ticket_metrics_show_url
    assert_response :success
  end

  test "should get edit" do
    get ticket_metrics_edit_url
    assert_response :success
  end

end
