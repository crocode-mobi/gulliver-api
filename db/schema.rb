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
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 20160511105108) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "activities", force: :cascade do |t|
    t.integer  "steps",      default: 0
    t.float    "distance",   default: 0.0
    t.float    "kcal",       default: 0.0
    t.date     "done_at"
    t.integer  "user_id"
    t.datetime "created_at",               null: false
    t.datetime "updated_at",               null: false
  end

  add_index "activities", ["done_at", "user_id"], name: "index_activities_on_done_at_and_user_id", unique: true, using: :btree

  create_table "badges_sashes", force: :cascade do |t|
    t.integer  "badge_id"
    t.integer  "sash_id"
    t.boolean  "notified_user", default: false
    t.datetime "created_at"
  end

  add_index "badges_sashes", ["badge_id", "sash_id"], name: "index_badges_sashes_on_badge_id_and_sash_id", using: :btree
  add_index "badges_sashes", ["badge_id"], name: "index_badges_sashes_on_badge_id", using: :btree
  add_index "badges_sashes", ["sash_id"], name: "index_badges_sashes_on_sash_id", using: :btree

  create_table "finished_stages", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "stage_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "finished_stages", ["user_id", "stage_id"], name: "index_finished_stages_on_user_id_and_stage_id", unique: true, using: :btree

  create_table "hydratations", force: :cascade do |t|
    t.float    "quantity"
    t.integer  "user_id"
    t.date     "consumed_at"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  add_index "hydratations", ["user_id", "consumed_at"], name: "index_hydratations_on_user_id_and_consumed_at", unique: true, using: :btree

  create_table "meals", force: :cascade do |t|
    t.integer  "cereal"
    t.integer  "fruit"
    t.integer  "vegetable"
    t.integer  "meat"
    t.integer  "dairy"
    t.integer  "sweets"
    t.integer  "fats"
    t.date     "consumed_at"
    t.integer  "user_id"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  add_index "meals", ["user_id", "consumed_at"], name: "index_meals_on_user_id_and_consumed_at", unique: true, using: :btree

  create_table "merit_actions", force: :cascade do |t|
    t.integer  "user_id"
    t.string   "action_method"
    t.integer  "action_value"
    t.boolean  "had_errors",    default: false
    t.string   "target_model"
    t.integer  "target_id"
    t.text     "target_data"
    t.boolean  "processed",     default: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "merit_activity_logs", force: :cascade do |t|
    t.integer  "action_id"
    t.string   "related_change_type"
    t.integer  "related_change_id"
    t.string   "description"
    t.datetime "created_at"
  end

  create_table "merit_score_points", force: :cascade do |t|
    t.integer  "score_id"
    t.integer  "num_points", default: 0
    t.string   "log"
    t.datetime "created_at"
  end

  create_table "merit_scores", force: :cascade do |t|
    t.integer "sash_id"
    t.string  "category", default: "default"
  end

  create_table "products", force: :cascade do |t|
    t.string   "title"
    t.string   "subtitle"
    t.text     "description"
    t.integer  "points"
    t.datetime "created_at",         null: false
    t.datetime "updated_at",         null: false
    t.string   "image_file_name"
    t.string   "image_content_type"
    t.integer  "image_file_size"
    t.datetime "image_updated_at"
  end

  create_table "purchased_products", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "product_id"
    t.integer  "points_billed"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
  end

  add_index "purchased_products", ["product_id"], name: "index_purchased_products_on_product_id", using: :btree
  add_index "purchased_products", ["user_id"], name: "index_purchased_products_on_user_id", using: :btree

  create_table "sashes", force: :cascade do |t|
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "stages", force: :cascade do |t|
    t.integer  "position"
    t.string   "from"
    t.string   "to"
    t.float    "distance"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "stages", ["position"], name: "index_stages_on_position", using: :btree

  create_table "tips", force: :cascade do |t|
    t.string   "title"
    t.text     "description"
    t.string   "section"
    t.integer  "points",             default: 0
    t.datetime "created_at",                     null: false
    t.datetime "updated_at",                     null: false
    t.string   "image_file_name"
    t.string   "image_content_type"
    t.integer  "image_file_size"
    t.datetime "image_updated_at"
  end

  add_index "tips", ["section"], name: "index_tips_on_section", using: :btree

  create_table "user_tokens", force: :cascade do |t|
    t.string   "token"
    t.integer  "user_id"
    t.string   "push_token"
    t.string   "ip"
    t.string   "device"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "user_tokens", ["token"], name: "index_user_tokens_on_token", using: :btree

  create_table "users", force: :cascade do |t|
    t.string   "email"
    t.string   "name"
    t.string   "salt"
    t.string   "encrypted_password"
    t.date     "birthday"
    t.string   "genre"
    t.integer  "weight"
    t.integer  "height"
    t.string   "location"
    t.integer  "account_status",      default: 0
    t.datetime "created_at",                        null: false
    t.datetime "updated_at",                        null: false
    t.integer  "sash_id"
    t.integer  "level",               default: 0
    t.integer  "total_steps",         default: 0
    t.float    "total_distance",      default: 0.0
    t.float    "total_kcal",          default: 0.0
    t.date     "last_activity_at"
    t.integer  "current_stage_id"
    t.date     "started_at"
    t.string   "avatar_file_name"
    t.string   "avatar_content_type"
    t.integer  "avatar_file_size"
    t.datetime "avatar_updated_at"
  end

  add_index "users", ["email"], name: "index_users_on_email", using: :btree

  create_table "viewed_tips", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "tip_id"
    t.boolean  "shared",     default: false
    t.datetime "created_at",                 null: false
    t.datetime "updated_at",                 null: false
  end

  add_index "viewed_tips", ["user_id", "tip_id"], name: "index_viewed_tips_on_user_id_and_tip_id", unique: true, using: :btree

end
