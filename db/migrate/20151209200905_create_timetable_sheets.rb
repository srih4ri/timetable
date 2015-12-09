class CreateTimetableSheets < ActiveRecord::Migration
  def change
    create_table :timetable_sheets do |t|
      t.references :user, index: true, foreign_key: true
      t.string :name

      t.timestamps null: false
    end
  end
end
