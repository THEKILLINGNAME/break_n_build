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

ActiveRecord::Schema[7.0].define(version: 2022_06_12_133738) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  # Custom types defined in this database.
  # Note that some types may not work with other database engines. Be careful if changing database.
  create_enum "product_categories", ["drills", "screwdrivers", "chargers", "perforators", "screwdriver_bits", "perforator_bits"]

  create_table "brands", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "charger_stats", force: :cascade do |t|
    t.string "capacity"
    t.string "output_voltage"
    t.string "type_of_charge"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "drill_stats", force: :cascade do |t|
    t.string "power_type"
    t.string "power"
    t.string "capacity"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "order_products", force: :cascade do |t|
    t.bigint "product_id"
    t.integer "amount"
    t.bigint "order_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["order_id"], name: "index_order_products_on_order_id"
    t.index ["product_id"], name: "index_order_products_on_product_id"
  end

  create_table "orders", force: :cascade do |t|
    t.bigint "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_orders_on_user_id"
  end

  create_table "perforator_bit_stats", force: :cascade do |t|
    t.string "diametr"
    t.string "length"
    t.string "cartridge_type"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "perforator_stats", force: :cascade do |t|
    t.string "power"
    t.string "rounds_per_min"
    t.string "strokes_per_min"
    t.string "catrtridge_type"
    t.string "drilling_diameter"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "products", force: :cascade do |t|
    t.string "title", null: false
    t.text "description"
    t.bigint "brand_id", null: false
    t.integer "price", null: false
    t.boolean "stock", default: true, null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.text "image_data"
    t.bigint "drill_stat_id"
    t.bigint "screwdriver_stat_id"
    t.bigint "charger_stat_id"
    t.bigint "perforator_stat_id"
    t.bigint "screwdriver_bit_stat_id"
    t.bigint "perforator_bit_stat_id"
    t.enum "category", default: "drills", null: false, enum_type: "product_categories"
    t.index ["brand_id"], name: "index_products_on_brand_id"
    t.index ["charger_stat_id"], name: "index_products_on_charger_stat_id"
    t.index ["drill_stat_id"], name: "index_products_on_drill_stat_id"
    t.index ["perforator_bit_stat_id"], name: "index_products_on_perforator_bit_stat_id"
    t.index ["perforator_stat_id"], name: "index_products_on_perforator_stat_id"
    t.index ["screwdriver_bit_stat_id"], name: "index_products_on_screwdriver_bit_stat_id"
    t.index ["screwdriver_stat_id"], name: "index_products_on_screwdriver_stat_id"
  end

  create_table "screwdriver_bit_stats", force: :cascade do |t|
    t.string "length"
    t.string "size"
    t.string "shlitz_type"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "screwdriver_stats", force: :cascade do |t|
    t.string "power_type"
    t.string "power"
    t.string "rounds_per_min"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
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
    t.boolean "receiving_news", default: false, null: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "products", "brands"
  add_foreign_key "products", "charger_stats"
  add_foreign_key "products", "drill_stats"
  add_foreign_key "products", "perforator_bit_stats"
  add_foreign_key "products", "perforator_stats"
  add_foreign_key "products", "screwdriver_bit_stats"
  add_foreign_key "products", "screwdriver_stats"
end
