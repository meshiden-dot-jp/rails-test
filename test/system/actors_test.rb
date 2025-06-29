require "application_system_test_case"

class ActorsTest < ApplicationSystemTestCase
  setup do
    @actor = actors(:one)
  end

  test "visiting the index" do
    visit actors_url
    assert_selector "h1", text: "Actors"
  end

  test "should create actor" do
    visit actors_url
    click_on "New actor"

    fill_in "Birth date", with: @actor.birth_date
    fill_in "Blood type", with: @actor.blood_type
    fill_in "Gender", with: @actor.gender
    fill_in "Height", with: @actor.height
    fill_in "Name", with: @actor.name
    fill_in "Weight", with: @actor.weight
    click_on "Create Actor"

    assert_text "Actor was successfully created"
    click_on "Back"
  end

  test "should update Actor" do
    visit actor_url(@actor)
    click_on "Edit this actor", match: :first

    fill_in "Birth date", with: @actor.birth_date
    fill_in "Blood type", with: @actor.blood_type
    fill_in "Gender", with: @actor.gender
    fill_in "Height", with: @actor.height
    fill_in "Name", with: @actor.name
    fill_in "Weight", with: @actor.weight
    click_on "Update Actor"

    assert_text "Actor was successfully updated"
    click_on "Back"
  end

  test "should destroy Actor" do
    visit actor_url(@actor)
    click_on "Destroy this actor", match: :first

    assert_text "Actor was successfully destroyed"
  end
end
