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

ActiveRecord::Schema.define(version: 20150818162940) do

  create_table "events", force: :cascade do |t|
    t.string   "location"
    t.text     "description"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.string   "title"
    t.integer  "creator_id"
    t.date     "date"
    t.time     "start_time"
  end

  add_index "events", ["creator_id"], name: "index_events_on_creator_id"
  add_index "events", ["date", "start_time", "creator_id"], name: "index_events_on_date_and_start_time_and_creator_id", unique: true

  create_table "invites", force: :cascade do |t|
    t.integer  "attendee_id"
    t.integer  "attended_event_id"
    t.datetime "created_at",        null: false
    t.datetime "updated_at",        null: false
  end

  add_index "invites", ["attended_event_id"], name: "index_invites_on_attended_event_id"
  add_index "invites", ["attendee_id", "attended_event_id"], name: "index_invites_on_attendee_id_and_attended_event_id", unique: true
  add_index "invites", ["attendee_id"], name: "index_invites_on_attendee_id"

  create_table "users", force: :cascade do |t|
    t.string   "name"
    t.string   "email"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
    t.string   "remember_digest"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true

end
