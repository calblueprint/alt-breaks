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

ActiveRecord::Schema.define(:version => 20130805083738) do

  create_table "admin_permissions", :force => true do |t|
    t.integer  "user_id"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "dashboards", :force => true do |t|
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "pages", :force => true do |t|
    t.string   "name"
    t.text     "description"
    t.integer  "permission"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
  end

  create_table "partners", :force => true do |t|
    t.string   "name"
    t.text     "description"
    t.string   "website"
    t.datetime "created_at",        :null => false
    t.datetime "updated_at",        :null => false
    t.string   "logo_file_name"
    t.string   "logo_content_type"
    t.integer  "logo_file_size"
    t.datetime "logo_updated_at"
    t.integer  "trip_id"
    t.integer  "partner_id"
  end

  create_table "partners_trips", :id => false, :force => true do |t|
    t.integer "partner_id"
    t.integer "trip_id"
  end

  add_index "partners_trips", ["partner_id", "trip_id"], :name => "index_partners_trips_on_partner_id_and_trip_id"
  add_index "partners_trips", ["trip_id", "partner_id"], :name => "index_partners_trips_on_trip_id_and_partner_id"

  create_table "photos", :force => true do |t|
    t.integer  "testimony_id"
    t.text     "caption"
    t.datetime "created_at",         :null => false
    t.datetime "updated_at",         :null => false
    t.string   "photo_file_name"
    t.string   "photo_content_type"
    t.integer  "photo_file_size"
    t.datetime "photo_updated_at"
  end

  create_table "posts", :force => true do |t|
    t.integer  "user_id"
    t.integer  "trip_instance_id"
    t.text     "description"
    t.string   "video_link"
    t.datetime "created_at",       :null => false
    t.datetime "updated_at",       :null => false
    t.string   "title"
    t.integer  "trip_id"
    t.integer  "page_id"
    t.string   "pdf_file_name"
    t.string   "pdf_content_type"
    t.integer  "pdf_file_size"
    t.datetime "pdf_updated_at"
  end

  create_table "requests", :force => true do |t|
    t.datetime "created_at",       :null => false
    t.datetime "updated_at",       :null => false
    t.integer  "user_id"
    t.integer  "trip_instance_id"
  end

  create_table "responses", :force => true do |t|
    t.integer  "user_id"
    t.integer  "post_id"
    t.text     "content"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "testimonies", :force => true do |t|
    t.integer  "trip_instance_id"
    t.integer  "user_id"
    t.text     "description"
    t.datetime "created_at",       :null => false
    t.datetime "updated_at",       :null => false
  end

  create_table "trip_instances", :force => true do |t|
    t.integer  "year"
    t.text     "description"
    t.datetime "created_at",       :null => false
    t.datetime "updated_at",       :null => false
    t.integer  "trip_id"
    t.string   "season"
    t.integer  "current_owner_id"
  end

  create_table "trip_permissions", :force => true do |t|
    t.integer  "trip_instance_id"
    t.integer  "user_id"
    t.integer  "permission"
    t.datetime "created_at",       :null => false
    t.datetime "updated_at",       :null => false
  end

  create_table "trips", :force => true do |t|
    t.string   "location"
    t.text     "description"
    t.datetime "created_at",               :null => false
    t.datetime "updated_at",               :null => false
    t.string   "name"
    t.string   "subtitle"
    t.integer  "current_trip_instance_id"
    t.float    "latitude"
    t.float    "longitude"
    t.boolean  "gmaps"
    t.string   "cover_photo_file_name"
    t.string   "cover_photo_content_type"
    t.integer  "cover_photo_file_size"
    t.datetime "cover_photo_updated_at"
    t.integer  "zoom_level"
  end

  create_table "users", :force => true do |t|
    t.string   "first_name"
    t.string   "last_name"
    t.integer  "grad_year"
    t.string   "major"
    t.datetime "created_at",                             :null => false
    t.datetime "updated_at",                             :null => false
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
    t.string   "avatar_file_name"
    t.string   "avatar_content_type"
    t.integer  "avatar_file_size"
    t.datetime "avatar_updated_at"
    t.text     "about_me"
    t.string   "title"
  end

  add_index "users", ["email"], :name => "index_users_on_email", :unique => true
  add_index "users", ["reset_password_token"], :name => "index_users_on_reset_password_token", :unique => true

end
