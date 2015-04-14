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

ActiveRecord::Schema.define(version: 20150414010052) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "activations", force: :cascade do |t|
    t.integer  "aid"
    t.integer  "snid"
    t.string   "system_code"
    t.string   "activation_id"
    t.string   "computer_description"
    t.datetime "activation_date"
    t.boolean  "active_activation"
    t.datetime "deactivation_date"
    t.string   "deactivation_by"
    t.datetime "created_at",           null: false
    t.datetime "updated_at",           null: false
    t.integer  "serial_number_id"
  end

  create_table "contacts", force: :cascade do |t|
    t.integer  "cid"
    t.integer  "fid"
    t.string   "contact_name"
    t.string   "contact_address"
    t.string   "contact_city"
    t.string   "contact_state"
    t.string   "contact_zip_code"
    t.string   "contact_country"
    t.boolean  "fair_address"
    t.string   "contact_phone_1"
    t.string   "contact_phone_2"
    t.string   "contact_phone_cell"
    t.string   "contact_email"
    t.datetime "contact_date_registered"
    t.datetime "contact_last_edited"
    t.datetime "contact_date_address_last_active"
    t.datetime "contact_last_mailed"
    t.boolean  "contact_active"
    t.integer  "contact_reputation"
    t.text     "contact_notes"
    t.boolean  "do_not_mail"
    t.boolean  "showorks_web_contact"
    t.string   "source"
    t.boolean  "to_print"
    t.integer  "valid_address"
    t.boolean  "bad_address"
    t.boolean  "bulk_mail_2000_cd"
    t.boolean  "to_terrell"
    t.boolean  "bulk_mail_2003_cd"
    t.boolean  "international"
    t.boolean  "gift_basket"
    t.boolean  "brochure_2004_fall"
    t.boolean  "christmas_card_2004"
    t.boolean  "temp_flag"
    t.boolean  "sweb_mailout"
    t.boolean  "nalsrma"
    t.boolean  "filled_out_form_at_2005_rmfa"
    t.boolean  "christmas_card_2005"
    t.boolean  "filled_out_form_at_2005_iafe"
    t.boolean  "followup"
    t.boolean  "flag"
    t.boolean  "excel_workshop_06"
    t.boolean  "eclassroom_06"
    t.boolean  "iafe_06"
    t.boolean  "competitor_booth_06"
    t.datetime "date_last_emailed_for_service_reminder"
    t.boolean  "do_not_remind_for_service"
    t.boolean  "state_convention_07"
    t.boolean  "workshop_07"
    t.boolean  "christmas_card_07"
    t.boolean  "christmas_box_07"
    t.boolean  "beta_tester"
    t.boolean  "wyoming_training"
    t.boolean  "recieved_thank_you_from_christmas_box"
    t.boolean  "eblast_2012_announce"
    t.boolean  "christmas_2011"
    t.boolean  "bulk_ne"
    t.datetime "created_at",                             null: false
    t.datetime "updated_at",                             null: false
    t.integer  "fair_id"
    t.integer  "created_by"
    t.integer  "updated_by"
    t.boolean  "sync"
  end

  create_table "delayed_jobs", force: :cascade do |t|
    t.integer  "priority",   default: 0, null: false
    t.integer  "attempts",   default: 0, null: false
    t.text     "handler",                null: false
    t.text     "last_error"
    t.datetime "run_at"
    t.datetime "locked_at"
    t.datetime "failed_at"
    t.string   "locked_by"
    t.string   "queue"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "delayed_jobs", ["priority", "run_at"], name: "delayed_jobs_priority", using: :btree

  create_table "fairs", force: :cascade do |t|
    t.integer  "fid"
    t.boolean  "is_fair"
    t.string   "fair_name"
    t.string   "fair_state"
    t.text     "fair_notes"
    t.string   "video_key"
    t.string   "video_key_2009"
    t.string   "video_key_2006"
    t.boolean  "purchased"
    t.boolean  "returned_product"
    t.boolean  "converted_from_competition"
    t.boolean  "feather_in_hat"
    t.integer  "fair_time"
    t.integer  "incidents_remaining"
    t.string   "service_plan_number"
    t.datetime "old_service_plan_ended"
    t.string   "old_service_plan_number"
    t.boolean  "international"
    t.boolean  "showorks_web_user"
    t.boolean  "temp_flag"
    t.boolean  "free_upgrade"
    t.boolean  "poor_payment"
    t.boolean  "christmas_2010"
    t.boolean  "christmas_2011"
    t.boolean  "processed_2012"
    t.boolean  "mailed_2012_invoice"
    t.boolean  "courtesy_late_pmt"
    t.boolean  "bulk_ne"
    t.boolean  "judas"
    t.datetime "created_at",                 null: false
    t.datetime "updated_at",                 null: false
  end

  create_table "messages", force: :cascade do |t|
    t.integer  "iid"
    t.integer  "cid"
    t.datetime "incident_date"
    t.integer  "incident_type"
    t.text     "incident_memo"
    t.datetime "incident_follow_up_date"
    t.boolean  "incident_closed"
    t.boolean  "incident_charge"
    t.datetime "created_at",              null: false
    t.datetime "updated_at",              null: false
    t.integer  "contact_id"
    t.integer  "created_by"
    t.integer  "updated_by"
    t.boolean  "sync"
  end

  create_table "serial_numbers", force: :cascade do |t|
    t.integer  "snid"
    t.integer  "fid"
    t.string   "version"
    t.string   "edition"
    t.string   "fair_name"
    t.string   "serial_number"
    t.datetime "issue_date"
    t.boolean  "active_serial_number"
    t.integer  "extras"
    t.integer  "service_plan_override"
    t.datetime "created_at",            null: false
    t.datetime "updated_at",            null: false
    t.integer  "fair_id"
  end

  create_table "user_logins", force: :cascade do |t|
    t.integer  "user_id"
    t.datetime "sign_in_at"
    t.inet     "sign_in_ip"
  end

  add_index "user_logins", ["user_id"], name: "index_user_logins_on_user_id", using: :btree

  create_table "users", force: :cascade do |t|
    t.string   "email",                  default: "",                           null: false
    t.string   "encrypted_password",     default: "",                           null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,                            null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet     "current_sign_in_ip"
    t.inet     "last_sign_in_ip"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "role"
    t.datetime "last_seen"
    t.string   "time_zone",              default: "Central Time (US & Canada)"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree

end
