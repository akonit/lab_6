require 'test_helper'

class SearchControllerTest < ActionController::TestCase
  test "should get by_film" do
    get :by_film
    assert_response :success
  end

end
