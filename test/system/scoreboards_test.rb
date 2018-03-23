require 'application_system_test_case'

class ScoreboardsTest < ApplicationSystemTestCase

  test "scoreboard" do
    visit '/scoreboard'

    assert_text "Scoreboard"
    assert_text "User 1"
    assert_text "0.001"
  end

end
