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
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20120305014555) do

  create_table "branches", :force => true do |t|
    t.string   "name"
    t.string   "country"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "courses", :force => true do |t|
    t.string   "date_of_course"
    t.string   "time_of_course"
    t.integer  "roomnumber"
    t.string   "tutor"
    t.integer  "category_of_course"
    t.string   "name"
    t.string   "description"
    t.string   "status"
    t.string   "duration"
    t.integer  "maxallowed"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "course_id"
    t.string   "slug"
  end

  add_index "courses", ["slug"], :name => "index_courses_on_slug"

  create_table "employees", :force => true do |t|
    t.string   "firstname"
    t.string   "lastname"
    t.string   "sex"
    t.integer  "level"
    t.integer  "mobile"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "email"
    t.integer  "employee_id"
  end

  create_table "progresses", :force => true do |t|
    t.integer  "course_id"
    t.integer  "employee_id"
    t.integer  "status"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "trainers", :force => true do |t|
    t.string   "firstname"
    t.string   "lastname"
    t.string   "sex"
    t.string   "handle"
    t.integer  "mobile"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "email"
  end

  create_table "users", :force => true do |t|
    t.string   "email"
    t.string   "crypted_password"
    t.string   "salt"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "reset_password_token"
    t.datetime "reset_password_token_expires_at"
    t.datetime "reset_password_email_sent_at"
    t.integer  "failed_logins_count",             :default => 0
    t.datetime "lock_expires_at"
    t.string   "activation_state"
    t.string   "activation_token"
    t.datetime "activation_token_expires_at"
    t.boolean  "admin",                           :default => false
    t.boolean  "employee",                        :default => false
  end

  add_index "users", ["activation_token"], :name => "index_users_on_activation_token"
  add_index "users", ["reset_password_token"], :name => "index_users_on_reset_password_token"

end
