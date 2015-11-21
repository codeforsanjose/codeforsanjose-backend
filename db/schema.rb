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

ActiveRecord::Schema.define(version: 20151120184830) do

  create_table "meetup_events", force: :cascade do |t|
    t.string   "name"
    t.string   "event_url"
    t.string   "address"
    t.string   "address_name"
    t.string   "address_city"
    t.integer  "time",           limit: 8
    t.integer  "duration"
    t.integer  "yes_rsvp_count"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "projects", force: :cascade do |t|
    t.string   "name"
    t.string   "homepage"
    t.string   "url"
    t.string   "stage"
    t.string   "technologies"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "users", force: :cascade do |t|
    t.string   "username"
    t.string   "email"
    t.string   "encrypted_password"
    t.string   "salt"
    t.string   "technologies"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
