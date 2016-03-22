# == Schema Information
#
# Table name: routes
#
#  id                :integer          not null, primary key
#  user_id           :integer          not null
#  alias             :string           not null
#  distance_in_meter :integer          not null
#  created_at        :datetime         not null
#  updated_at        :datetime         not null
#
require 'test_helper'

class RoutesControllerTest < ActionController::TestCase

  include Devise::TestHelpers

  test "should redirect to sign_in path" do
    get :index, user_id: users(:one)
    assert_redirected_to new_user_session_path
  end

  test "should get index" do
    sign_in users(:one)
    get :index, user_id: users(:one)
    assert_response :success
  end

end
