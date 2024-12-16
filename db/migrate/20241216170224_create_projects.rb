class CreateProjects < ActiveRecord::Migration[8.0]
  def change
    create_table :projects do |t|
      t.text :slug, null: false
      t.text :name, null: false
      t.text :website, null: false
      t.datetime :founded_at, null: false
      t.datetime :verified_at, null: true

      t.timestamps
    end

    add_index :projects, :slug, unique: true
    add_index :projects, :name, unique: true
    add_index :projects, :website, unique: true
    add_index :projects, :founded_at
    add_index :projects, :verified_at
  end
end
