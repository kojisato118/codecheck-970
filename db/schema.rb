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

ActiveRecord::Schema.define(version: 20160214163328) do

  create_table "projects", force: :cascade do |t|
    t.string   "url"
    t.string   "title",              null: false
    t.text     "description",        null: false
    t.datetime "created_at",         null: false
    t.datetime "updated_at",         null: false
    t.string   "image_file_name"
    t.string   "image_content_type"
    t.integer  "image_file_size"
    t.datetime "image_updated_at"
  end

  create_table "qiita_items", force: :cascade do |t|
    t.string   "qiita_item_id", null: false
    t.string   "title",         null: false
    t.text     "description",   null: false
    t.string   "url",           null: false
    t.string   "image"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
  end

  add_index "qiita_items", ["qiita_item_id"], name: "index_qiita_items_on_qiita_item_id", unique: true

end
