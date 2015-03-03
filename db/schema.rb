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

ActiveRecord::Schema.define(version: 20150302221641) do

  create_table "auto_billings", force: :cascade do |t|
    t.integer  "user_id"
    t.string   "amount"
    t.integer  "credits"
    t.string   "active"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
    t.integer  "franchise_id"
  end

  add_index "auto_billings", ["franchise_id"], name: "index_auto_billings_on_franchise_id"
  add_index "auto_billings", ["user_id"], name: "index_auto_billings_on_user_id"

  create_table "buses", force: :cascade do |t|
    t.string   "name"
    t.string   "description"
    t.integer  "franchise_id"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
  end

  add_index "buses", ["franchise_id"], name: "index_buses_on_franchise_id"

  create_table "evaluations", force: :cascade do |t|
    t.string   "field"
    t.string   "field2"
    t.string   "field3"
    t.string   "picture"
    t.integer  "student_id"
    t.integer  "franchise_id"
    t.integer  "user_id"
    t.datetime "created_at",           null: false
    t.datetime "updated_at",           null: false
    t.string   "picture_file_name"
    t.string   "picture_content_type"
    t.integer  "picture_file_size"
    t.datetime "picture_uploaded_at"
  end

  add_index "evaluations", ["franchise_id"], name: "index_evaluations_on_franchise_id"
  add_index "evaluations", ["student_id"], name: "index_evaluations_on_student_id"
  add_index "evaluations", ["user_id"], name: "index_evaluations_on_user_id"

  create_table "franchises", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "mailboxer_conversation_opt_outs", force: :cascade do |t|
    t.integer "unsubscriber_id"
    t.string  "unsubscriber_type"
    t.integer "conversation_id"
  end

  add_index "mailboxer_conversation_opt_outs", ["conversation_id"], name: "index_mailboxer_conversation_opt_outs_on_conversation_id"
  add_index "mailboxer_conversation_opt_outs", ["unsubscriber_id", "unsubscriber_type"], name: "index_mailboxer_conversation_opt_outs_on_unsubscriber_id_type"

  create_table "mailboxer_conversations", force: :cascade do |t|
    t.string   "subject",    default: ""
    t.datetime "created_at",              null: false
    t.datetime "updated_at",              null: false
  end

  create_table "mailboxer_notifications", force: :cascade do |t|
    t.string   "type"
    t.text     "body"
    t.string   "subject",              default: ""
    t.integer  "sender_id"
    t.string   "sender_type"
    t.integer  "conversation_id"
    t.boolean  "draft",                default: false
    t.string   "notification_code"
    t.integer  "notified_object_id"
    t.string   "notified_object_type"
    t.string   "attachment"
    t.datetime "updated_at",                           null: false
    t.datetime "created_at",                           null: false
    t.boolean  "global",               default: false
    t.datetime "expires"
  end

  add_index "mailboxer_notifications", ["conversation_id"], name: "index_mailboxer_notifications_on_conversation_id"
  add_index "mailboxer_notifications", ["notified_object_id", "notified_object_type"], name: "index_mailboxer_notifications_on_notified_object_id_and_type"
  add_index "mailboxer_notifications", ["sender_id", "sender_type"], name: "index_mailboxer_notifications_on_sender_id_and_sender_type"
  add_index "mailboxer_notifications", ["type"], name: "index_mailboxer_notifications_on_type"

  create_table "mailboxer_receipts", force: :cascade do |t|
    t.integer  "receiver_id"
    t.string   "receiver_type"
    t.integer  "notification_id",                            null: false
    t.boolean  "is_read",                    default: false
    t.boolean  "trashed",                    default: false
    t.boolean  "deleted",                    default: false
    t.string   "mailbox_type",    limit: 25
    t.datetime "created_at",                                 null: false
    t.datetime "updated_at",                                 null: false
  end

  add_index "mailboxer_receipts", ["notification_id"], name: "index_mailboxer_receipts_on_notification_id"
  add_index "mailboxer_receipts", ["receiver_id", "receiver_type"], name: "index_mailboxer_receipts_on_receiver_id_and_receiver_type"

  create_table "payment_profiles", force: :cascade do |t|
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
