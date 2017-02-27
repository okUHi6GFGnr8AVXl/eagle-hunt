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

ActiveRecord::Schema.define(version: 20170227111841) do

  create_table "accountings", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.integer  "order_id"
    t.float    "total_payment", limit: 24
    t.datetime "created_at",               null: false
    t.datetime "updated_at",               null: false
    t.index ["order_id"], name: "index_accountings_on_order_id", using: :btree
  end

  create_table "avail_workshops", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.integer  "furniture_id"
    t.integer  "workshop_id"
    t.float    "proposed_cost", limit: 24
    t.datetime "created_at",               null: false
    t.datetime "updated_at",               null: false
    t.index ["furniture_id"], name: "index_avail_workshops_on_furniture_id", using: :btree
    t.index ["workshop_id"], name: "index_avail_workshops_on_workshop_id", using: :btree
  end

  create_table "cost_factors", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.float    "size_parche",       limit: 24
    t.float    "size_kanaf",        limit: 24
    t.float    "size_abr",          limit: 24
    t.float    "wage_khayat",       limit: 24
    t.float    "wage_rokob",        limit: 24
    t.float    "wage_naghash",      limit: 24
    t.float    "wage_najar",        limit: 24
    t.float    "parche_colour",     limit: 24
    t.float    "parche_design",     limit: 24
    t.float    "kande_colours",     limit: 24
    t.float    "kande_design",      limit: 24
    t.float    "transfer_cost",     limit: 24
    t.float    "extras",            limit: 24
    t.float    "profit_percentage", limit: 24
    t.datetime "created_at",                   null: false
    t.datetime "updated_at",                   null: false
  end

  create_table "furniture_details", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.float    "size_parche", limit: 24
    t.float    "size_kanaf",  limit: 24
    t.float    "size_abr",    limit: 24
    t.boolean  "available"
    t.json     "images"
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

  create_table "furniture_wages", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.float    "khayat",     limit: 24
    t.float    "rokob",      limit: 24
    t.float    "naghash",    limit: 24
    t.float    "naja",       limit: 24
    t.float    "extra",      limit: 24
    t.text     "comment",    limit: 65535
    t.datetime "created_at",               null: false
    t.datetime "updated_at",               null: false
  end

  create_table "furnitures", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string   "name"
    t.integer  "furniture_detail_id"
    t.integer  "furniture_wage_id"
    t.text     "comment",             limit: 65535
    t.datetime "created_at",                        null: false
    t.datetime "updated_at",                        null: false
    t.integer  "transfer_cost_id"
    t.index ["furniture_detail_id"], name: "index_furnitures_on_furniture_detail_id", using: :btree
    t.index ["furniture_wage_id"], name: "index_furnitures_on_furniture_wage_id", using: :btree
    t.index ["transfer_cost_id"], name: "index_furnitures_on_transfer_cost_id", using: :btree
  end

  create_table "kande_colours", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.json     "details"
    t.float    "cost",       limit: 24
    t.datetime "created_at",            null: false
    t.datetime "updated_at",            null: false
  end

  create_table "order_statuses", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.json     "state"
    t.datetime "shipped_at"
    t.datetime "delivered_at"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
  end

  create_table "orders", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.integer  "user_id"
    t.integer  "furniture_id"
    t.integer  "parche_colour_id"
    t.integer  "parche_design_id"
    t.integer  "kande_colour_id"
    t.integer  "count"
    t.datetime "created_at",       null: false
    t.datetime "updated_at",       null: false
    t.index ["furniture_id"], name: "index_orders_on_furniture_id", using: :btree
    t.index ["kande_colour_id"], name: "index_orders_on_kande_colour_id", using: :btree
    t.index ["parche_colour_id"], name: "index_orders_on_parche_colour_id", using: :btree
    t.index ["parche_design_id"], name: "index_orders_on_parche_design_id", using: :btree
    t.index ["user_id"], name: "index_orders_on_user_id", using: :btree
  end

  create_table "parche_colours", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.json     "details"
    t.float    "cost",       limit: 24
    t.datetime "created_at",            null: false
    t.datetime "updated_at",            null: false
  end

  create_table "parche_designs", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.json     "details"
    t.float    "cost",       limit: 24
    t.datetime "created_at",            null: false
    t.datetime "updated_at",            null: false
  end

  create_table "payments", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.integer  "accounting_id"
    t.float    "payment",       limit: 24
    t.datetime "created_at",               null: false
    t.datetime "updated_at",               null: false
    t.index ["accounting_id"], name: "index_payments_on_accounting_id", using: :btree
  end

  create_table "profiles", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.integer  "user_id"
    t.string   "first_name"
    t.string   "last_name"
    t.string   "contact"
    t.text     "address",    limit: 65535
    t.json     "avatar"
    t.datetime "created_at",               null: false
    t.datetime "updated_at",               null: false
    t.index ["user_id"], name: "index_profiles_on_user_id", using: :btree
  end

  create_table "transfer_costs", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.text     "title",      limit: 65535
    t.float    "cost",       limit: 24
    t.text     "comment",    limit: 65535
    t.datetime "created_at",               null: false
    t.datetime "updated_at",               null: false
  end

  create_table "users", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string   "email",                  default: "", null: false
    t.string   "username",               default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.string   "confirmation_token"
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.integer  "failed_attempts",        default: 0,  null: false
    t.string   "unlock_token"
    t.datetime "locked_at"
    t.integer  "auth_level",             default: 1,  null: false
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
    t.integer  "profile_id"
    t.index ["confirmation_token"], name: "index_users_on_confirmation_token", unique: true, using: :btree
    t.index ["email"], name: "index_users_on_email", unique: true, using: :btree
    t.index ["profile_id"], name: "index_users_on_profile_id", using: :btree
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree
    t.index ["unlock_token"], name: "index_users_on_unlock_token", unique: true, using: :btree
  end

  create_table "workshop_types", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string   "type"
    t.text     "comment",    limit: 65535
    t.datetime "created_at",               null: false
    t.datetime "updated_at",               null: false
  end

  create_table "workshops", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string   "name"
    t.string   "manager"
    t.text     "address",          limit: 65535
    t.string   "contact"
    t.text     "comment",          limit: 65535
    t.integer  "workshop_type_id"
    t.datetime "created_at",                     null: false
    t.datetime "updated_at",                     null: false
    t.index ["workshop_type_id"], name: "index_workshops_on_workshop_type_id", using: :btree
  end

  add_foreign_key "accountings", "orders"
  add_foreign_key "avail_workshops", "furnitures"
  add_foreign_key "avail_workshops", "workshops"
  add_foreign_key "furnitures", "furniture_details"
  add_foreign_key "furnitures", "furniture_wages"
  add_foreign_key "furnitures", "transfer_costs"
  add_foreign_key "orders", "furnitures"
  add_foreign_key "orders", "kande_colours"
  add_foreign_key "orders", "parche_colours"
  add_foreign_key "orders", "parche_designs"
  add_foreign_key "orders", "users"
  add_foreign_key "payments", "accountings"
  add_foreign_key "profiles", "users"
  add_foreign_key "users", "profiles"
end
