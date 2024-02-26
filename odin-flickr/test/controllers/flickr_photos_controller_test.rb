require "test_helper"

class FlickrPhotosControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get flickr_photos_index_url
    assert_response :success
  end
end
