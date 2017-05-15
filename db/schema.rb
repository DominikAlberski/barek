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

ActiveRecord::Schema.define(version: 20170515120403) do

  create_table "alcohols", force: :cascade do |t|
    t.string "name"
    t.string "brand"
    t.string "kind"
    t.string "country"
    t.integer "alk"
    t.decimal "price", precision: 5, scale: 2
    t.string "photo"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "user_id"
  end

  create_table "cocktails", force: :cascade do |t|
    t.string "name"
    t.text "description"
    t.string "photo"
    t.integer "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_cocktails_on_user_id"
  end

  create_table "ingredients", force: :cascade do |t|
    t.integer "cocktail_id"
    t.integer "alcohol_id"
    t.integer "other_ingredient_id"
    t.integer "quantity"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["alcohol_id"], name: "index_ingredients_on_alcohol_id"
    t.index ["cocktail_id"], name: "index_ingredients_on_cocktail_id"
    t.index ["other_ingredient_id"], name: "index_ingredients_on_other_ingredient_id"
  end

  create_table "liqueurs", force: :cascade do |t|
    t.string "kind"
    t.integer "alcohol_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["alcohol_id"], name: "index_liqueurs_on_alcohol_id"
  end

  create_table "other_ingredients", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "others", force: :cascade do |t|
    t.string "kind"
    t.integer "alcohol_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["alcohol_id"], name: "index_others_on_alcohol_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer "sign_in_count", default: 0, null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string "current_sign_in_ip"
    t.string "last_sign_in_ip"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  create_table "vodkas", force: :cascade do |t|
    t.string "kind"
    t.integer "alcohol_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["alcohol_id"], name: "index_vodkas_on_alcohol_id"
  end

  create_table "whiskeys", force: :cascade do |t|
    t.string "age"
    t.string "region"
    t.string "kind"
    t.string "cask"
    t.text "description"
    t.integer "alcohol_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["alcohol_id"], name: "index_whiskeys_on_alcohol_id"
  end

  create_table "wines", force: :cascade do |t|
    t.string "kind"
    t.string "color"
    t.integer "alcohol_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["alcohol_id"], name: "index_wines_on_alcohol_id"
  end

end
