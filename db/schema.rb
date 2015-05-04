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

ActiveRecord::Schema.define(version: 20150428133859) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "exercise_categories", force: :cascade do |t|
    t.string   "name"
    t.string   "description"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.string   "example"
  end

  create_table "exercises", force: :cascade do |t|
    t.integer  "points"
    t.datetime "created_at",                       null: false
    t.datetime "updated_at",                       null: false
    t.integer  "exercise_category_id"
    t.string   "code_to_refactor"
    t.string   "solution"
    t.string   "key_words"
    t.integer  "status",               default: 0
  end

  add_index "exercises", ["exercise_category_id"], name: "index_exercises_on_exercise_category_id", using: :btree

  create_table "user_exercises", force: :cascade do |t|
    t.integer  "exercise_id"
    t.integer  "user_id"
    t.datetime "created_at",              null: false
    t.datetime "updated_at",              null: false
    t.integer  "status",      default: 0
  end

  add_index "user_exercises", ["exercise_id"], name: "index_user_exercises_on_exercise_id", using: :btree
  add_index "user_exercises", ["user_id"], name: "index_user_exercises_on_user_id", using: :btree

  create_table "users", force: :cascade do |t|
    t.string   "first_name"
    t.string   "last_name"
    t.string   "email"
    t.integer  "score"
    t.datetime "created_at",                           null: false
    t.datetime "updated_at",                           null: false
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",       default: 0,      null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet     "current_sign_in_ip"
    t.inet     "last_sign_in_ip"
    t.string   "profile_picture"
    t.string   "role",                default: "user"
  end

end
