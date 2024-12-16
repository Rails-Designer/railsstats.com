class CreateSnapshotMetrics < ActiveRecord::Migration[8.0]
  def change
    create_table :snapshot_metrics do |t|
      t.belongs_to :snapshot, null: false, foreign_key: true
      t.text :name, null: false
      t.integer :lines, default: 0
      t.integer :lines_of_code, default: 0
      t.integer :classes, default: 0
      t.integer :methods, default: 0

      t.timestamps
    end

    add_index :snapshot_metrics, :name
  end
end
