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
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20130506074855) do

  create_table "divisions", :force => true do |t|
    t.string   "name"
    t.integer  "user_id"
    t.integer  "school_id"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "divisions_subjects", :id => false, :force => true do |t|
    t.integer "division_id"
    t.integer "subject_id"
  end

  add_index "divisions_subjects", ["division_id", "subject_id"], :name => "index_divisions_subjects_on_division_id_and_subject_id"
  add_index "divisions_subjects", ["subject_id", "division_id"], :name => "index_divisions_subjects_on_subject_id_and_division_id"

  create_table "divisions_users", :id => false, :force => true do |t|
    t.integer "division_id"
    t.integer "user_id"
  end

  add_index "divisions_users", ["division_id", "user_id"], :name => "index_divisions_users_on_division_id_and_user_id"
  add_index "divisions_users", ["user_id", "division_id"], :name => "index_divisions_users_on_user_id_and_division_id"

  create_table "folders", :force => true do |t|
    t.integer "user_id"
    t.string  "name"
  end

  create_table "grades", :force => true do |t|
    t.integer  "user_id"
    t.integer  "student_id"
    t.integer  "subject_id"
    t.string   "value"
    t.text     "description"
    t.boolean  "is_semester", :default => false
    t.datetime "created_at",                     :null => false
    t.datetime "updated_at",                     :null => false
    t.integer  "weight_id"
  end

  add_index "grades", ["weight_id"], :name => "index_grades_on_weight_id"

  create_table "message_recipients", :force => true do |t|
    t.integer "message_id"
    t.integer "user_id"
  end

  create_table "messages", :force => true do |t|
    t.integer  "sender_id"
    t.integer  "folder_id"
    t.text     "recipient_names"
    t.string   "title"
    t.text     "body"
    t.boolean  "is_read",         :default => false
    t.datetime "created_at",                         :null => false
    t.datetime "updated_at",                         :null => false
  end

  create_table "roles", :force => true do |t|
    t.string   "name"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "schools", :force => true do |t|
    t.string   "name"
    t.string   "domain"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "students", :force => true do |t|
    t.string   "firstname"
    t.string   "lastname"
    t.integer  "lp"
    t.integer  "division_id"
    t.integer  "school_id"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
    t.integer  "user_id"
  end

  create_table "subjects", :force => true do |t|
    t.string   "name"
    t.integer  "school_id"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
    t.string   "system_name"
  end

  create_table "subjects_users", :id => false, :force => true do |t|
    t.integer "subject_id"
    t.integer "user_id"
  end

  add_index "subjects_users", ["subject_id", "user_id"], :name => "index_subjects_users_on_subject_id_and_user_id"
  add_index "subjects_users", ["user_id", "subject_id"], :name => "index_subjects_users_on_user_id_and_subject_id"

  create_table "users", :force => true do |t|
    t.string   "email",                  :default => "", :null => false
    t.string   "encrypted_password",     :default => "", :null => false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          :default => 0
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at",                             :null => false
    t.datetime "updated_at",                             :null => false
    t.integer  "role_id"
    t.string   "username"
    t.integer  "school_id"
    t.string   "fullname"
    t.string   "access_token"
  end

  add_index "users", ["username", "school_id"], :name => "index_users_on_username_and_school_id", :unique => true

  create_table "weights", :force => true do |t|
    t.integer  "school_id"
    t.string   "name"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

end
