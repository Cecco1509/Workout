require "application_system_test_case"

class DayToExercisesTest < ApplicationSystemTestCase
  setup do
    @day_to_exercise = day_to_exercises(:one)
  end

  test "visiting the index" do
    visit day_to_exercises_url
    assert_selector "h1", text: "Day to exercises"
  end

  test "should create day to exercise" do
    visit day_to_exercises_url
    click_on "New day to exercise"

    fill_in "Day", with: @day_to_exercise.day_id
    fill_in "Exercise", with: @day_to_exercise.exercise_id
    click_on "Create Day to exercise"

    assert_text "Day to exercise was successfully created"
    click_on "Back"
  end

  test "should update Day to exercise" do
    visit day_to_exercise_url(@day_to_exercise)
    click_on "Edit this day to exercise", match: :first

    fill_in "Day", with: @day_to_exercise.day_id
    fill_in "Exercise", with: @day_to_exercise.exercise_id
    click_on "Update Day to exercise"

    assert_text "Day to exercise was successfully updated"
    click_on "Back"
  end

  test "should destroy Day to exercise" do
    visit day_to_exercise_url(@day_to_exercise)
    click_on "Destroy this day to exercise", match: :first

    assert_text "Day to exercise was successfully destroyed"
  end
end
