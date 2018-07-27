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

ActiveRecord::Schema.define(version: 20180723130515) do

  create_table "abilities", force: :cascade do |t|
    t.boolean  "plan"
    t.boolean  "mc"
    t.boolean  "video"
    t.boolean  "design"
    t.boolean  "sns"
    t.integer  "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "addresses", force: :cascade do |t|
    t.string   "roadAdress"
    t.string   "sido"
    t.integer  "x"
    t.integer  "y"
    t.integer  "assembly_id"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "assemblies", force: :cascade do |t|
    t.string   "title"
    t.string   "thumnailImg"
    t.string   "posterImg"
    t.text     "content"
    t.text     "purpose"
    t.date     "calendar"
    t.string   "reportImg"
    t.integer  "donateGoal"
    t.date     "donateDeadline"
    t.integer  "category"
    t.integer  "like"
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
  end

  create_table "careers", force: :cascade do |t|
    t.string   "content"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "categories", force: :cascade do |t|
    t.boolean  "politic"
    t.boolean  "society"
    t.boolean  "education"
    t.boolean  "labor"
    t.boolean  "foodMedi"
    t.boolean  "press"
    t.boolean  "environment"
    t.boolean  "right"
    t.boolean  "female"
    t.integer  "user_id"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "donations", force: :cascade do |t|
    t.integer  "donateUser"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "hosts", force: :cascade do |t|
    t.string   "name"
    t.string   "profileImg"
    t.string   "email"
    t.text     "intro"
    t.integer  "assembly_id"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "likes", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "scraps", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
    t.integer  "profileImg"
    t.boolean  "matching"
    t.text     "introduce"
    t.boolean  "admin"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true

end
