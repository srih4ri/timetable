class CreateTimetableEntries < ActiveRecord::Migration
  def change
    create_table :timetable_entries do |t|
      t.text :teacher_ids, array: true, default: []
      t.references :classroom, index: true
      t.references :period, index: true
      t.references :subject, index: true

      t.timestamps null: false
    end
  end
end
