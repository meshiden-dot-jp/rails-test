require "test_helper"

class ActorTest < ActiveSupport::TestCase

  test "no data" do
    actor = Actor.new()
    assert actor.invalid?
    assert actor.errors[:name].any?
    assert actor.errors[:birth_date].any?
    assert actor.errors[:height].any?
    assert actor.errors[:gender].any?
  end

  test "empty data" do
    actor = Actor.new(name: "", birth_date: "", height: "", weight: "", gender: "", blood_type: "")
    assert actor.invalid?
    assert actor.errors[:name].any?
    assert actor.errors[:birth_date].any?
    assert actor.errors[:height].any?
    assert actor.errors[:gender].any?
  end

  test "invalid data" do
    actor = Actor.new(
      name: "John",
      birth_date: "1980-01-01",
      height: 30,
      weight: 500,
      gender: "unknown",
      blood_type: "Z"
    )
    assert actor.invalid?
    assert actor.errors[:height].any?
    assert actor.errors[:weight].any?
    assert actor.errors[:gender].any?
    assert actor.errors[:blood_type].any?
  end

  test "valid data" do
    actor = Actor.new(
      name: "Jane Doe",
      birth_date: "1990-05-05",
      height: 170,
      weight: 60,
      gender: "male",
      blood_type: "A"
    )
    assert actor.valid?
  end

end
