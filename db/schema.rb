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

ActiveRecord::Schema.define(version: 2020_03_10_163420) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "proyects", force: :cascade do |t|
    t.string "name", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "proyects_technologies", force: :cascade do |t|
    t.bigint "proyect_id"
    t.bigint "technology_id"
    t.index ["proyect_id"], name: "index_proyects_technologies_on_proyect_id"
    t.index ["technology_id"], name: "index_proyects_technologies_on_technology_id"
  end

  create_table "technologies", force: :cascade do |t|
    t.string "name", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

end
