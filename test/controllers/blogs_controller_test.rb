require 'test_helper'

class BlogsControllerTest < ActionDispatch::IntegrationTest
  test "should get home" do
    get blogs_home_url
    assert_response :success
  end

end
