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

ActiveRecord::Schema.define(:version => 20121206131506) do

  create_table "account_types", :force => true do |t|
    t.string   "account_name"
    t.string   "price"
    t.datetime "created_at",   :null => false
    t.datetime "updated_at",   :null => false
  end

  create_table "beep_ats", :force => true do |t|
    t.integer  "user_id"
    t.integer  "beep_id"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "beep_comments", :force => true do |t|
    t.integer  "beep_id"
    t.integer  "user_id"
    t.text     "beep_content"
    t.text     "hide"
    t.datetime "created_at",   :null => false
    t.datetime "updated_at",   :null => false
  end

  create_table "beep_pictures", :force => true do |t|
    t.integer  "user_id"
    t.integer  "beep_id"
    t.text     "description"
    t.string   "image_file_name"
    t.string   "image_content_type"
    t.integer  "image_file_size"
    t.datetime "image_updated_at"
    t.datetime "created_at",         :null => false
    t.datetime "updated_at",         :null => false
  end

  create_table "beeps", :force => true do |t|
    t.integer  "user_id"
    t.text     "beep_content"
    t.string   "scope"
    t.string   "quote_flag"
    t.integer  "quoted_user"
    t.integer  "quoted_beep"
    t.integer  "beeped_at"
    t.integer  "compete_id"
    t.datetime "created_at",   :null => false
    t.datetime "updated_at",   :null => false
  end

  create_table "comment_competes", :force => true do |t|
    t.integer  "compete_id"
    t.integer  "user_id"
    t.text     "content"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "comment_images", :force => true do |t|
    t.text     "comment"
    t.integer  "image_id"
    t.integer  "user_id"
    t.integer  "comment_id"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "comments", :force => true do |t|
    t.integer  "item_id"
    t.integer  "commenter_id"
    t.text     "comment_text"
    t.integer  "comment_flag", :default => 1
    t.datetime "created_at",                  :null => false
    t.datetime "updated_at",                  :null => false
  end

  create_table "competes", :force => true do |t|
    t.integer  "user_id"
    t.integer  "oponent_id"
    t.integer  "original_beep"
    t.datetime "created_at",    :null => false
    t.datetime "updated_at",    :null => false
  end

  create_table "conversations", :force => true do |t|
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
    t.integer  "user_id"
    t.integer  "receiver_id"
  end

  create_table "dislikes", :force => true do |t|
    t.integer  "beep_id"
    t.integer  "user_id"
    t.text     "hide"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "feed_backs", :force => true do |t|
    t.string   "comment"
    t.integer  "like"
    t.integer  "hate"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "feeds", :force => true do |t|
    t.integer  "source_id"
    t.integer  "second_source_id"
    t.integer  "user_id"
    t.string   "source"
    t.string   "second_source"
    t.integer  "item_id"
    t.integer  "beep_id"
    t.integer  "compete_id"
    t.string   "third_source"
    t.string   "fought_source"
    t.datetime "created_at",       :null => false
    t.datetime "updated_at",       :null => false
  end

  create_table "find_friends", :force => true do |t|
    t.string   "name"
    t.string   "user_name"
    t.string   "email"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "game_numbers", :force => true do |t|
    t.integer  "number"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "item_interests", :force => true do |t|
    t.string   "name"
    t.string   "email"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "items", :force => true do |t|
    t.string   "item_name"
    t.float    "item_price"
    t.float    "partner_price"
    t.integer  "user_id"
    t.text     "description"
    t.string   "category"
    t.string   "item_status"
    t.string   "item_condition"
    t.string   "category_type"
    t.string   "manufacturer"
    t.integer  "contact_number", :limit => 8
    t.string   "BlackBerry_pin"
    t.datetime "created_at",                  :null => false
    t.datetime "updated_at",                  :null => false
  end

  create_table "jobs", :force => true do |t|
    t.integer "message_template_id"
    t.string  "status",              :default => "pending"
  end

  create_table "joins", :force => true do |t|
    t.integer  "beep_id"
    t.integer  "user_id"
    t.text     "hide"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "last_words", :force => true do |t|
    t.text     "last_words"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "likes", :force => true do |t|
    t.integer  "beep_id"
    t.integer  "user_id"
    t.text     "hide"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "message_templates", :force => true do |t|
    t.datetime "send_time"
    t.text     "email"
    t.text     "item_name"
  end

  create_table "messages", :force => true do |t|
    t.integer  "user_id"
    t.integer  "receiver_id"
    t.integer  "conversation_id"
    t.string   "subject"
    t.string   "status"
    t.text     "body"
    t.datetime "created_at",      :null => false
    t.datetime "updated_at",      :null => false
  end

  create_table "neutrals", :force => true do |t|
    t.integer  "beep_id"
    t.integer  "user_id"
    t.text     "content"
    t.text     "hide"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "notifications", :force => true do |t|
    t.string   "first_source"
    t.integer  "user_id"
    t.integer  "reviewer_id"
    t.integer  "first_source_id"
    t.string   "hidden_flag"
    t.string   "compete_id"
    t.integer  "message_id"
    t.integer  "beep_id"
    t.string   "notification_flag"
    t.datetime "created_at",        :null => false
    t.datetime "updated_at",        :null => false
  end

  create_table "opposes", :force => true do |t|
    t.integer  "beep_id"
    t.integer  "user_id"
    t.text     "content"
    t.text     "hide"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "partner_updates", :force => true do |t|
    t.integer  "user_id"
    t.integer  "updater_id"
    t.text     "comment"
    t.integer  "item_id"
    t.integer  "event_style"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
  end

  create_table "partners", :force => true do |t|
    t.integer  "inviter_id"
    t.integer  "invited_id"
    t.integer  "status"
    t.integer  "request_flag"
    t.datetime "created_at",   :null => false
    t.datetime "updated_at",   :null => false
  end

  create_table "partnerships", :force => true do |t|
    t.integer  "user_id"
    t.integer  "partner_id"
    t.string   "status"
    t.datetime "created_at",  :null => false
    t.datetime "accepted_at"
    t.datetime "updated_at",  :null => false
  end

  create_table "pictures", :force => true do |t|
    t.integer  "item_id"
    t.datetime "created_at",         :null => false
    t.datetime "updated_at",         :null => false
    t.string   "image_file_name"
    t.string   "image_content_type"
    t.integer  "image_file_size"
    t.datetime "image_updated_at"
  end

  create_table "profile_feeds", :force => true do |t|
    t.integer  "user_id"
    t.integer  "second_user_id"
    t.string   "action"
    t.integer  "beep_id"
    t.integer  "source_id"
    t.datetime "created_at",     :null => false
    t.datetime "updated_at",     :null => false
  end

  create_table "profile_images", :force => true do |t|
    t.string   "image_file_name"
    t.string   "image_content_type"
    t.integer  "image_file_size"
    t.datetime "image_updated_at"
    t.integer  "profile_id"
    t.datetime "created_at",         :null => false
    t.datetime "updated_at",         :null => false
  end

  create_table "profiles", :force => true do |t|
    t.integer  "profile_image_id"
    t.string   "bg_color"
    t.string   "font_color"
    t.string   "content_holder"
    t.integer  "user_id"
    t.datetime "created_at",       :null => false
    t.datetime "updated_at",       :null => false
  end

  create_table "ranks", :force => true do |t|
    t.integer  "user_id"
    t.integer  "user_point"
    t.string   "rank_type"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "rates", :force => true do |t|
    t.integer  "rate"
    t.integer  "rate_entry"
    t.integer  "item_id"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "requests", :force => true do |t|
    t.string   "user_name"
    t.string   "item_name"
    t.string   "email"
    t.string   "description"
    t.string   "cost"
    t.string   "flag"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
  end

  create_table "services", :force => true do |t|
    t.integer  "user_id"
    t.string   "service_name"
    t.string   "description"
    t.datetime "created_at",   :null => false
    t.datetime "updated_at",   :null => false
  end

  create_table "sessions", :force => true do |t|
    t.string   "session_id", :null => false
    t.text     "data"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  add_index "sessions", ["session_id"], :name => "index_sessions_on_session_id"
  add_index "sessions", ["updated_at"], :name => "index_sessions_on_updated_at"

  create_table "supports", :force => true do |t|
    t.integer  "beep_id"
    t.integer  "user_id"
    t.text     "content"
    t.text     "hide"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "tabs", :force => true do |t|
    t.string   "name"
    t.string   "user_name"
    t.string   "email"
    t.string   "tab_type"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "tabs_entries", :force => true do |t|
    t.integer  "tab_id"
    t.string   "comment"
    t.integer  "check"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "updates", :force => true do |t|
    t.text     "comment"
    t.integer  "user_id"
    t.integer  "updater_id"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "user_images", :force => true do |t|
    t.datetime "created_at",         :null => false
    t.datetime "updated_at",         :null => false
    t.string   "image_file_name"
    t.string   "image_content_type"
    t.integer  "image_file_size"
    t.datetime "image_updated_at"
    t.integer  "user_id"
  end

  create_table "users", :force => true do |t|
    t.string   "hashed_password"
    t.string   "first_name"
    t.string   "last_name"
    t.string   "user_name"
    t.string   "mobile"
    t.string   "email"
    t.string   "address"
    t.string   "state"
    t.string   "country"
    t.integer  "day"
    t.integer  "year"
    t.integer  "month"
    t.string   "user_type",       :default => "Regular"
    t.datetime "last_login"
    t.string   "reputation"
    t.datetime "created_at",                             :null => false
    t.datetime "updated_at",                             :null => false
  end

  create_table "vacancies", :force => true do |t|
    t.string   "name"
    t.string   "description"
    t.integer  "user_id"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
  end

end
