require 'test_helper'

class RejestracjaControllerTest < ActionController::TestCase
  test "should get strona_domowa" do
    get :strona_domowa
    assert_response :success
  end

end
