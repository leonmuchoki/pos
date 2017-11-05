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

ActiveRecord::Schema.define(version: 20171105115846) do

  create_table "customers", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1" do |t|
    t.string   "name"
    t.integer  "loyal_points"
    t.integer  "mobile"
    t.string   "address"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
  end

  create_table "drinks", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1" do |t|
    t.string   "name"
    t.decimal  "price",              precision: 8, scale: 2
    t.integer  "menu_id"
    t.datetime "created_at",                                 null: false
    t.datetime "updated_at",                                 null: false
    t.string   "image_file_name"
    t.string   "image_content_type"
    t.integer  "image_file_size"
    t.datetime "image_updated_at"
    t.index ["menu_id"], name: "index_drinks_on_menu_id", using: :btree
  end

  create_table "foods", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1" do |t|
    t.string   "name"
    t.decimal  "price",              precision: 8, scale: 2
    t.integer  "menu_id"
    t.datetime "created_at",                                 null: false
    t.datetime "updated_at",                                 null: false
    t.string   "image_file_name"
    t.string   "image_content_type"
    t.integer  "image_file_size"
    t.datetime "image_updated_at"
    t.index ["menu_id"], name: "index_foods_on_menu_id", using: :btree
  end

  create_table "menus", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1" do |t|
    t.integer  "food_id"
    t.integer  "drink_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string   "name"
  end

  create_table "order_details", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1" do |t|
    t.decimal  "amount",     precision: 10
    t.integer  "quantity"
    t.integer  "drink_id"
    t.integer  "food_id"
    t.integer  "order_id"
    t.datetime "created_at",                null: false
    t.datetime "updated_at",                null: false
    t.index ["drink_id"], name: "index_order_details_on_drink_id", using: :btree
    t.index ["food_id"], name: "index_order_details_on_food_id", using: :btree
    t.index ["order_id"], name: "index_order_details_on_order_id", using: :btree
  end

  create_table "order_drinks", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1" do |t|
    t.integer  "quantity"
    t.decimal  "amount",     precision: 10
    t.integer  "order_id"
    t.integer  "drink_id"
    t.datetime "created_at",                null: false
    t.datetime "updated_at",                null: false
    t.index ["drink_id"], name: "index_order_drinks_on_drink_id", using: :btree
    t.index ["order_id"], name: "index_order_drinks_on_order_id", using: :btree
  end

  create_table "order_foods", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1" do |t|
    t.integer  "quantity"
    t.decimal  "amount",     precision: 10
    t.integer  "order_id"
    t.integer  "food_id"
    t.datetime "created_at",                null: false
    t.datetime "updated_at",                null: false
    t.index ["food_id"], name: "index_order_foods_on_food_id", using: :btree
    t.index ["order_id"], name: "index_order_foods_on_order_id", using: :btree
  end

  create_table "orders", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1" do |t|
    t.decimal  "amount",              precision: 10
    t.boolean  "processed"
    t.datetime "created_at",                         null: false
    t.datetime "updated_at",                         null: false
    t.integer  "user_id"
    t.integer  "restaurant_table_id"
    t.index ["restaurant_table_id"], name: "index_orders_on_restaurant_table_id", using: :btree
    t.index ["user_id"], name: "index_orders_on_user_id", using: :btree
  end

  create_table "restaurant_tables", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1" do |t|
    t.boolean  "available",   default: true
    t.integer  "table_no"
    t.integer  "accomodates"
    t.datetime "created_at",                 null: false
    t.datetime "updated_at",                 null: false
  end

  create_table "users", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1" do |t|
    t.string   "email",                  default: "",    null: false
    t.string   "encrypted_password",     default: "",    null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,     null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at",                             null: false
    t.datetime "updated_at",                             null: false
    t.string   "api_key"
    t.boolean  "admin",                  default: false
    t.boolean  "staff",                  default: true
    t.index ["api_key"], name: "index_users_on_api_key", using: :btree
    t.index ["email"], name: "index_users_on_email", unique: true, using: :btree
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree
  end

  add_foreign_key "drinks", "menus"
  add_foreign_key "foods", "menus"
  add_foreign_key "order_details", "drinks"
  add_foreign_key "order_details", "foods"
  add_foreign_key "order_details", "orders"
  add_foreign_key "order_drinks", "drinks"
  add_foreign_key "order_drinks", "orders"
  add_foreign_key "order_foods", "foods"
  add_foreign_key "order_foods", "orders"
  add_foreign_key "orders", "restaurant_tables"
  add_foreign_key "orders", "users"
end
