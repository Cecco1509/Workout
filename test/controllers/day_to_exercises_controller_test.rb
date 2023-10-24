require "test_helper"

class DayToExercisesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @day_to_exercise = day_to_exercises(:one)
  end

  test "should get index" do
    get day_to_exercises_url
    assert_response :success
  end

  test "should get new" do
    get new_day_to_exercise_url
    assert_response :success
  end

  test "should create day_to_exercise" do
    assert_difference("DayToExercise.count") do
      post day_to_exercises_url, params: { day_to_exercise: { day_id: @day_to_exercise.day_id, exercise_id: @day_to_exercise.exercise_id } }
    end

    assert_redirected_to day_to_exercise_url(DayToExercise.last)
  end

  test "should show day_to_exercise" do
    get day_to_exercise_url(@day_to_exercise)
    assert_response :success
  end

  test "should get edit" do
    get edit_day_to_exercise_url(@day_to_exercise)
    assert_response :success
  end

  test "should update day_to_exercise" do
    patch day_to_exercise_url(@day_to_exercise), params: { day_to_exercise: { day_id: @day_to_exercise.day_id, exercise_id: @day_to_exercise.exercise_id } }
    assert_redirected_to day_to_exercise_url(@day_to_exercise)
  end

  test "should destroy day_to_exercise" do
    assert_difference("DayToExercise.count", -1) do
      delete day_to_exercise_url(@day_to_exercise)
    end

    assert_redirected_to day_to_exercises_url
  end
end
