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

ActiveRecord::Schema.define(version: 2020_05_04_030829) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "active_admin_comments", force: :cascade do |t|
    t.string "namespace"
    t.text "body"
    t.string "resource_type"
    t.bigint "resource_id"
    t.string "author_type"
    t.bigint "author_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["author_type", "author_id"], name: "index_active_admin_comments_on_author_type_and_author_id"
    t.index ["namespace"], name: "index_active_admin_comments_on_namespace"
    t.index ["resource_type", "resource_id"], name: "index_active_admin_comments_on_resource_type_and_resource_id"
  end

  create_table "admin_users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_admin_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_admin_users_on_reset_password_token", unique: true
  end

  create_table "contactmes", force: :cascade do |t|
    t.string "name"
    t.string "email"
    t.text "description"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "follows", force: :cascade do |t|
    t.bigint "user_id"
    t.bigint "organizator_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["organizator_id"], name: "index_follows_on_organizator_id"
    t.index ["user_id"], name: "index_follows_on_user_id"
  end

  create_table "organizators", force: :cascade do |t|
    t.string "name"
    t.integer "phone"
    t.string "description"
    t.boolean "admin"
    t.string "address"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.index ["email"], name: "index_organizators_on_email", unique: true
    t.index ["reset_password_token"], name: "index_organizators_on_reset_password_token", unique: true
  end

  create_table "press_conferences", force: :cascade do |t|
    t.string "title"
    t.text "description"
    t.date "date"
    t.time "time"
    t.string "address"
    t.integer "status"
    t.bigint "organizator_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.boolean "postulacion", default: false
    t.float "latitude"
    t.float "longitude"
    t.index ["organizator_id"], name: "index_press_conferences_on_organizator_id"
  end

  create_table "profiles", force: :cascade do |t|
    t.string "photo"
    t.string "phone"
    t.text "description"
    t.string "social_network"
    t.string "social_network_url"
    t.string "media_name"
    t.bigint "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_profiles_on_user_id"
  end

  create_table "solicituds", force: :cascade do |t|
    t.bigint "user_id"
    t.bigint "press_conference_id"
    t.integer "status", default: 0
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["press_conference_id"], name: "index_solicituds_on_press_conference_id"
    t.index ["user_id"], name: "index_solicituds_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "name"
    t.string "lastname"
    t.string "rut"
    t.integer "user_type"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "follows", "organizators"
  add_foreign_key "follows", "users"
  add_foreign_key "press_conferences", "organizators"
  add_foreign_key "profiles", "users"
  add_foreign_key "solicituds", "press_conferences"
  add_foreign_key "solicituds", "users"
end
