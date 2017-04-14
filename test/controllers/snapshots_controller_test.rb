require 'test_helper'

class SnapshotsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @snapshot = snapshots(:one)
  end

  test "should get index" do
    get snapshots_url
    assert_response :success
  end

  test "should get new" do
    get new_snapshot_url
    assert_response :success
  end

  test "should create snapshot" do
    assert_difference('Snapshot.count') do
      post snapshots_url, params: { snapshot: { date: @snapshot.date, episode_id: @snapshot.episode_id, views: @snapshot.views } }
    end

    assert_redirected_to snapshot_url(Snapshot.last)
  end

  test "should show snapshot" do
    get snapshot_url(@snapshot)
    assert_response :success
  end

  test "should get edit" do
    get edit_snapshot_url(@snapshot)
    assert_response :success
  end

  test "should update snapshot" do
    patch snapshot_url(@snapshot), params: { snapshot: { date: @snapshot.date, episode_id: @snapshot.episode_id, views: @snapshot.views } }
    assert_redirected_to snapshot_url(@snapshot)
  end

  test "should destroy snapshot" do
    assert_difference('Snapshot.count', -1) do
      delete snapshot_url(@snapshot)
    end

    assert_redirected_to snapshots_url
  end
end
