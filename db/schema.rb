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

ActiveRecord::Schema.define(version: 4) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "portfolios", force: :cascade do |t|
    t.text "title"
    t.text "description"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.bigint "template_id"
    t.index ["template_id"], name: "index_portfolios_on_template_id"
  end

  create_table "projects", force: :cascade do |t|
    t.text "title"
    t.text "caption"
    t.text "project_url"
    t.text "github_url"
    t.text "thumbnail_url"
    t.text "demo_url"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.bigint "portfolio_id"
    t.index ["portfolio_id"], name: "index_projects_on_portfolio_id"
  end

  create_table "templates", force: :cascade do |t|
    t.integer "template_number"
    t.text "type"
    t.text "theme"
    t.boolean "dark_theme", default: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "users", force: :cascade do |t|
    t.text "firstname"
    t.text "lastname"
    t.text "email"
    t.text "username"
    t.text "password_digest"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  add_foreign_key "portfolios", "templates"
  add_foreign_key "projects", "portfolios"
end
