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

ActiveRecord::Schema.define(version: 20171023150434) do

  create_table "courses", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string   "course_code"
    t.string   "name"
    t.string   "address"
    t.string   "description"
    t.string   "url"
    t.string   "image_url"
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
    t.float    "latitude",    limit: 24
    t.float    "longitude",   limit: 24
  end

  create_table "masterscores", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.integer  "user_id"
    t.integer  "total_score"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.date     "date"
    t.string   "course_code"
    t.string   "course_name"
    t.index ["user_id"], name: "index_masterscores_on_user_id", using: :btree
  end

  create_table "scores", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.integer  "hole_no"
    t.integer  "hole_score"
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
    t.integer  "masterscore_id"
    t.index ["masterscore_id"], name: "index_scores_on_Masterscore_id", using: :btree
  end

  create_table "users", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string   "name"
    t.string   "email"
    t.string   "password_digest"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
  end

  add_foreign_key "masterscores", "users"
end
