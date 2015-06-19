require 'test_helper'

class GameMatchesControllerTest < ActionController::TestCase
  setup do
    @game_match = game_matches(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:game_matches)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create game_match" do
    assert_difference('GameMatch.count') do
      post :create, game_match: { away_score: @game_match.away_score, away_team: @game_match.away_team, date: @game_match.date, home_score: @game_match.home_score, home_team: @game_match.home_team, round: @game_match.round, venue: @game_match.venue, year: @game_match.year }
    end

    assert_redirected_to game_match_path(assigns(:game_match))
  end

  test "should show game_match" do
    get :show, id: @game_match
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @game_match
    assert_response :success
  end

  test "should update game_match" do
    patch :update, id: @game_match, game_match: { away_score: @game_match.away_score, away_team: @game_match.away_team, date: @game_match.date, home_score: @game_match.home_score, home_team: @game_match.home_team, round: @game_match.round, venue: @game_match.venue, year: @game_match.year }
    assert_redirected_to game_match_path(assigns(:game_match))
  end

  test "should destroy game_match" do
    assert_difference('GameMatch.count', -1) do
      delete :destroy, id: @game_match
    end

    assert_redirected_to game_matches_path
  end
end
