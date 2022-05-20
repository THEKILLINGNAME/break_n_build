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

ActiveRecord::Schema[7.0].define(version: 2022_05_20_124521) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "brands", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "product_drill_stats", force: :cascade do |t|
    t.string "power_type"
    t.string "power"
    t.string "capacity"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "product_screwdriver_stats", force: :cascade do |t|
    t.string "power_type"
    t.string "power"
    t.string "rounds_per_min"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "products", force: :cascade do |t|
    t.string "title", null: false
    t.text "description"
    t.bigint "brand_id", null: false
    t.float "price", null: false
    t.boolean "stock", default: true, null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.text "image_data"
    t.bigint "product_drill_stat_id"
    t.bigint "product_screwdriver_stat_id"
    t.jsonb "stats"
    t.index ["brand_id"], name: "index_products_on_brand_id"
    t.index ["product_drill_stat_id"], name: "index_products_on_product_drill_stat_id"
    t.index ["product_screwdriver_stat_id"], name: "index_products_on_product_screwdriver_stat_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.boolean "admin", default: false, null: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "products", "brands"
  add_foreign_key "products", "product_drill_stats"
  add_foreign_key "products", "product_screwdriver_stats"
end
