require 'test_helper'

class ScoreboardControllerTest < ActionController::TestCase

  include Devise::Test::ControllerHelpers

  test "should assign yellow jersey" do
    get :index
    assert assigns(:yellow_jersey)
  end

  test "should assign polka dot jersey" do
    get :index
    assert assigns(:polka_dot_jersey)
  end

  test "should assign green jersey" do
    get :index
    assert assigns(:green_jersey)
  end

  test "should assign pink jersey" do
    get :index
    assert assigns(:pink_jersey)
  end

  test "should assign white jersey" do
    get :index
    assert assigns(:white_jersey)
  end

  test "should assign grey jersey" do
    get :index
    assert assigns(:grey_jersey)
  end
end
