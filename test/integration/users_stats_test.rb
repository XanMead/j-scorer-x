require 'test_helper'

class UsersStatsTest < ActionDispatch::IntegrationTest
  def setup
    @user = users(:dave)
  end

  test 'stats page display' do
    log_in_here @user
    get stats_path
    assert_template 'stats/show'
    assert_select 'title', 'J! Scorer - Stats'
    assert_select 'h2'
    assert_match @user.games.count.to_s, response.body
    assert_match 'bad-data-modal', response.body
  end
end
