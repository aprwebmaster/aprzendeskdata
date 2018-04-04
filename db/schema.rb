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

ActiveRecord::Schema.define(version: 20180404233730) do

  create_table "ticket_metrics", force: :cascade do |t|
    t.integer "zendesk_id"
    t.integer "ticket_id"
    t.date "assignee_updated_at"
    t.date "initially_assigned_at"
    t.date "solved_at"
    t.string "first_resolution_time_in_minutes"
    t.string "reply_time_in_minutes"
    t.string "full_resolution_time_in_minutes"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "tickets", force: :cascade do |t|
    t.integer "zendesk_id"
    t.integer "external_id"
    t.string "subject"
    t.string "description"
    t.string "status"
    t.string "recipient"
    t.integer "requester_id"
    t.integer "submitter_id"
    t.integer "assignee_id"
    t.integer "group_id"
    t.text "tags"
    t.string "satisfaction_rating"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.integer "zendesk_id"
    t.string "url"
    t.string "name"
    t.string "email"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "time_zone"
    t.string "phone"
    t.string "shared_phone_number"
    t.string "photo"
    t.string "locale_id"
    t.string "locale"
    t.string "organization_id"
    t.string "role"
    t.boolean "verified"
    t.string "external_id"
    t.string "tags"
    t.string "alias"
    t.boolean "active"
    t.boolean "shared"
    t.boolean "shared_agent"
    t.string "last_login_at"
    t.boolean "two_factor_auth_enabled"
    t.string "signature"
    t.string "details"
    t.string "notes"
    t.string "role_type"
    t.string "custom_role_id"
    t.boolean "moderator"
    t.string "ticket_restriction"
    t.boolean "only_private_comments"
    t.boolean "restricted_agent"
    t.boolean "suspended"
    t.boolean "chat_only"
    t.string "default_group_id"
    t.string "user_fields"
    t.integer "zendesk_id_int"
  end

end
