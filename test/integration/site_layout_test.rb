require 'test_helper'

class SiteLayoutTest < ActionDispatch::IntegrationTest

  test "layout links" do
    get root_path
    #test home page
    assert_template 'static_pages/home'
    assert_select "a[href=?]", root_path
  end
end
