require 'test_helper'

class StaticPagesControllerTest < ActionDispatch::IntegrationTest

  def setup
    @base_title = "Pay It Forward"
  end

  test "should get home" do
    get root_path
    assert_response :success
    #assert_select "#{@base_title}"
  end

  test "should get help" do
    get help_path
    assert_response :success
   # assert_select "#{@base_title}"
  end

end
