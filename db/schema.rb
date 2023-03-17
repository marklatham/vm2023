# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema[7.0].define(version: 2023_03_06_121438) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

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

  create_table "clippings", force: :cascade do |t|
    t.date "date_sequence"
    t.string "date_text"
    t.string "source"
    t.string "source_url"
    t.string "author"
    t.string "title"
    t.string "title_url"
    t.text "description"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "links", force: :cascade do |t|
    t.string "title"
    t.string "url"
    t.string "category"
    t.text "description"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "presentations", force: :cascade do |t|
    t.date "pdate"
    t.string "place"
    t.string "host"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "proposals", force: :cascade do |t|
    t.date "date_submitted"
    t.date "date_agm"
    t.string "company"
    t.string "company_url"
    t.string "ticker"
    t.string "proposal_type"
    t.string "proposal_url"
    t.text "correspondence"
    t.string "proxy_url"
    t.boolean "in_proxy"
    t.float "yes_percent"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "pubs", force: :cascade do |t|
    t.date "date"
    t.string "title"
    t.float "pages"
    t.integer "stars", default: 1
    t.string "country"
    t.string "description"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "videos", force: :cascade do |t|
    t.string "title", default: ""
    t.text "description"
    t.string "tags", default: ""
    t.string "category", default: ""
    t.string "url", default: ""
    t.text "transcript"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

end
