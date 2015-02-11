# encoding: UTF-8
# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 20150211163723) do

  create_table "buses", force: :cascade do |t|
    t.string   "name"
    t.string   "description"
    t.integer  "franchise_id"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
  end

  add_index "buses", ["franchise_id"], name: "index_buses_on_franchise_id"

  create_table "franchises", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "payments", force: :cascade do |t|
    t.string   "status"
    t.float    "amount"
    t.string   "transaction_number"
    t.datetime "created_at",         null: false
    t.datetime "updated_at",         null: false
  end

  create_table "posts", force: :cascade do |t|
    t.string   "name"
    t.text     "body"
    t.integer  "user_id"
    t.integer  "franchise_id"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
  end

  add_index "posts", ["franchise_id"], name: "index_posts_on_franchise_id"
  add_index "posts", ["user_id"], name: "index_posts_on_user_id"

  create_table "preschools", force: :cascade do |t|
    t.string   "name"
    t.text     "description"
    t.string   "address_1"
    t.string   "address_2"
    t.string   "city"
    t.string   "state"
    t.string   "zip"
    t.string   "phone"
    t.string   "director"
    t.integer  "franchise_id"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
  end

  add_index "preschools", ["franchise_id"], name: "index_preschools_on_franchise_id"

  create_table "roles", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "rosters", force: :cascade do |t|
    t.integer  "section_id"
    t.integer  "franchise_id"
    t.integer  "student_id"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
  end

  add_index "rosters", ["franchise_id"], name: "index_rosters_on_franchise_id"
  add_index "rosters", ["section_id"], name: "index_rosters_on_section_id"
  add_index "rosters", ["student_id"], name: "index_rosters_on_student_id"

  create_table "sections", force: :cascade do |t|
    t.string   "name"
    t.text     "description"
    t.integer  "class_size"
    t.string   "section_time"
    t.integer  "preschool_id"
    t.integer  "franchise_id"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
  end

  add_index "sections", ["franchise_id"], name: "index_sections_on_franchise_id"
  add_index "sections", ["preschool_id"], name: "index_sections_on_preschool_id"

  create_table "students", force: :cascade do |t|
    t.string   "first_name"
    t.string   "last_name"
    t.date     "birthdate"
    t.integer  "user_id"
    t.integer  "franchise_id"
    t.integer  "preschool_id"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
  end

  add_index "students", ["franchise_id"], name: "index_students_on_franchise_id"
  add_index "students", ["preschool_id"], name: "index_students_on_preschool_id"
  add_index "students", ["user_id"], name: "index_students_on_user_id"

# Could not dump table "users" because of following NoMethodError
#   undefined method `[]' for nil:NilClass

end
