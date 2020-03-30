# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `rails
# db:schema:load`. When creating a new database, `rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2020_03_12_192536) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "contributors", force: :cascade do |t|
    t.string "name", null: false
    t.integer "workload", null: false
    t.integer "country", default: 0, null: false
    t.date "admission_date", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end
  
  create_table "projects", force: :cascade do |t|
    t.string "name", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "projects_technologies", force: :cascade do |t|
    t.bigint "project_id"
    t.bigint "technology_id"
    t.index ["project_id"], name: "index_projects_technologies_on_project_id"
    t.index ["technology_id"], name: "index_projects_technologies_on_technology_id"
  end
  
  create_table "job_assignations", force: :cascade do |t|
    t.bigint "role_id", null: false
    t.bigint "contributor_id", null: false
    t.index ["contributor_id"], name: "index_job_assignations_on_contributor_id"
    t.index ["role_id"], name: "index_job_assignations_on_role_id"
  end

  create_table "roles", force: :cascade do |t|
    t.integer "name"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "technologies", force: :cascade do |t|
    t.string "name", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

end
