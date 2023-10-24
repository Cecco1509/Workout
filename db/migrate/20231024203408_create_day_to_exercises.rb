class CreateDayToExercises < ActiveRecord::Migration[7.0]
  def change
    create_table :day_to_exercises do |t|
      t.references :day, null: false, foreign_key: true
      t.references :exercise, null: false, foreign_key: true

      t.timestamps
    end
  end
end
