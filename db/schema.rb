# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema[8.0].define(version: 2024_12_16_170403) do
  create_table "projects", force: :cascade do |t|
    t.text "slug", null: false
    t.text "name", null: false
    t.text "website", null: false
    t.datetime "founded_at", null: false
    t.datetime "verified_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["founded_at"], name: "index_projects_on_founded_at"
    t.index ["name"], name: "index_projects_on_name", unique: true
    t.index ["slug"], name: "index_projects_on_slug", unique: true
    t.index ["verified_at"], name: "index_projects_on_verified_at"
    t.index ["website"], name: "index_projects_on_website", unique: true
  end

  create_table "snapshot_metrics", force: :cascade do |t|
    t.integer "snapshot_id", null: false
    t.text "name", null: false
    t.integer "lines", default: 0
    t.integer "lines_of_code", default: 0
    t.integer "classes", default: 0
    t.integer "methods", default: 0
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["name"], name: "index_snapshot_metrics_on_name"
    t.index ["snapshot_id"], name: "index_snapshot_metrics_on_snapshot_id"
  end

  create_table "snapshots", force: :cascade do |t|
    t.integer "project_id", null: false
    t.text "raw_data", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["project_id"], name: "index_snapshots_on_project_id"
  end

  add_foreign_key "snapshot_metrics", "snapshots"
  add_foreign_key "snapshots", "projects"
end
