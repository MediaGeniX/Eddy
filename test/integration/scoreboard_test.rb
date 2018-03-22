require 'test_helper'
require 'capybara/rails'

class ScoreboardTest < Minitest::Capybara::Spec

  it "scoreboard" do
    visit '/scoreboard'

    page.must_have_content "Scoreboard"
    page.must_have_content "User 1"
    page.must_have_content "0.001"
  end

end
