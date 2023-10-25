class DayExerciseJoinTable < ActiveRecord::Migration[7.0]
  def change
    create_join_table :days, :exercises
  end
end
