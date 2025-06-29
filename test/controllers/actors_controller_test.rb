require "test_helper"

class ActorsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @actor = actors(:one)
  end

  test "should get index" do
    get actors_url
    assert_response :success
  end

  test "should get new" do
    get new_actor_url
    assert_response :success
  end

  test "should create actor" do
    assert_difference("Actor.count") do
      post actors_url, params: { actor: { birth_date: @actor.birth_date, blood_type: @actor.blood_type, gender: @actor.gender, height: @actor.height, name: @actor.name, weight: @actor.weight } }
    end

    assert_redirected_to actor_url(Actor.last)
  end

  test "should show actor" do
    get actor_url(@actor)
    assert_response :success
  end

  test "should get edit" do
    get edit_actor_url(@actor)
    assert_response :success
  end

  test "should update actor" do
    patch actor_url(@actor), params: { actor: { birth_date: @actor.birth_date, blood_type: @actor.blood_type, gender: @actor.gender, height: @actor.height, name: @actor.name, weight: @actor.weight } }
    assert_redirected_to actor_url(@actor)
  end

  test "should destroy actor" do
    assert_difference("Actor.count", -1) do
      delete actor_url(@actor)
    end

    assert_redirected_to actors_url
  end
end
