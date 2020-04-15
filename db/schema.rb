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

ActiveRecord::Schema.define(version: 2020_04_15_055818) do

  create_table "admins", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_admins_on_email", unique: true
    t.index ["reset_password_token"], name: "index_admins_on_reset_password_token", unique: true
  end

  create_table "book_marks", force: :cascade do |t|
    t.integer "consumer_id", null: false
    t.integer "fermer_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["consumer_id"], name: "index_book_marks_on_consumer_id"
    t.index ["fermer_id"], name: "index_book_marks_on_fermer_id"
  end

  create_table "brands", force: :cascade do |t|
    t.string "name"
    t.string "category_id"
    t.integer "brand_status"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "cards", force: :cascade do |t|
    t.integer "consumer_id", null: false
    t.string "payjp_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["consumer_id"], name: "index_cards_on_consumer_id"
  end

  create_table "cart_products", force: :cascade do |t|
    t.integer "consumer_id"
    t.integer "product_id"
    t.integer "quantity"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "categories", force: :cascade do |t|
    t.string "name"
    t.integer "category_status"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "ancestry"
    t.index ["ancestry"], name: "index_categories_on_ancestry"
  end

  create_table "column_comments", force: :cascade do |t|
    t.text "comment"
    t.integer "fermer_id"
    t.integer "consumer_id"
    t.integer "column_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "column_favorites", force: :cascade do |t|
    t.integer "fermer_id"
    t.integer "consumer_id"
    t.integer "column_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "column_images", force: :cascade do |t|
    t.integer "column_id"
    t.string "image_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "columns", force: :cascade do |t|
    t.string "title"
    t.text "body"
    t.integer "fermer_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "consumers", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.string "name"
    t.string "first_name"
    t.string "last_name"
    t.string "kana_first_name"
    t.string "kana_last_name"
    t.string "phone"
    t.integer "gender"
    t.integer "age"
    t.boolean "withdraw", default: false, null: false
    t.integer "postcode"
    t.integer "prefecture_code"
    t.string "address_city"
    t.string "address_street"
    t.string "address_building"
    t.string "profile_image_id"
    t.string "address"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_consumers_on_email", unique: true
    t.index ["reset_password_token"], name: "index_consumers_on_reset_password_token", unique: true
  end

  create_table "destinations", force: :cascade do |t|
    t.integer "consumer_id"
    t.integer "postcode"
    t.string "name"
    t.integer "prefecture_code"
    t.string "address_city"
    t.string "address_street"
    t.string "address_building"
    t.string "address"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "fermers", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.string "name"
    t.string "garden"
    t.string "profile_image_id"
    t.string "first_name"
    t.string "last_name"
    t.string "kana_first_name"
    t.string "kana_last_name"
    t.string "phone"
    t.boolean "withdraw", default: false, null: false
    t.integer "postcode"
    t.integer "prefecture_code"
    t.string "address_city"
    t.string "address_street"
    t.string "address_building"
    t.string "home_page"
    t.string "address"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_fermers_on_email", unique: true
    t.index ["reset_password_token"], name: "index_fermers_on_reset_password_token", unique: true
  end

  create_table "order_products", force: :cascade do |t|
    t.integer "product_id"
    t.integer "quantity"
    t.integer "product_status", default: 0
    t.integer "price"
    t.integer "order_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "orders", force: :cascade do |t|
    t.integer "consumer_id"
    t.integer "order_status", default: 0
    t.integer "payment_method"
    t.string "name"
    t.string "phone"
    t.integer "postcode"
    t.integer "prefecture_code"
    t.string "address_city"
    t.string "address_street"
    t.string "address_building"
    t.integer "postage", default: 800
    t.integer "billing_amount"
    t.string "address"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "product_comments", force: :cascade do |t|
    t.text "comment"
    t.integer "consumer_id"
    t.integer "product_id"
    t.string "title"
    t.float "rate"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "product_images", force: :cascade do |t|
    t.string "image_id"
    t.integer "product_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "products", force: :cascade do |t|
    t.string "name"
    t.integer "brand_id"
    t.integer "category_id"
    t.integer "quantity"
    t.integer "stock_id"
    t.integer "fermer_id"
    t.integer "sale_status"
    t.integer "unit_price"
    t.text "introduction"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

end
