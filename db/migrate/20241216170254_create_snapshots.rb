class CreateSnapshots < ActiveRecord::Migration[8.0]
  def change
    create_table :snapshots do |t|
      t.belongs_to :project, null: false, foreign_key: true
      t.text :raw_data, null: false

      t.timestamps
    end
  end
end
