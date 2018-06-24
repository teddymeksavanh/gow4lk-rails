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

ActiveRecord::Schema.define(version: 2018_06_06_143457) do

  create_table "active_storage_attachments", force: :cascade do |t|
    t.string "name", null: false
    t.string "record_type", null: false
    t.integer "record_id", null: false
    t.integer "blob_id", null: false
    t.datetime "created_at", null: false
    t.index ["blob_id"], name: "index_active_storage_attachments_on_blob_id"
    t.index ["record_type", "record_id", "name", "blob_id"], name: "index_active_storage_attachments_uniqueness", unique: true
  end

  create_table "active_storage_blobs", force: :cascade do |t|
    t.string "key", null: false
    t.string "filename", null: false
    t.string "content_type"
    t.text "metadata"
    t.bigint "byte_size", null: false
    t.string "checksum", null: false
    t.datetime "created_at", null: false
    t.index ["key"], name: "index_active_storage_blobs_on_key", unique: true
  end

  create_table "paths", force: :cascade do |t|
    t.string "name"
    t.float "latitude"
    t.float "longitude"
    t.text "description"
    t.integer "stroll_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["stroll_id"], name: "index_paths_on_stroll_id"
  end

  create_table "strolls", force: :cascade do |t|
    t.string "name"
    t.text "description"
    t.date "created_date"
    t.float "length"
    t.string "city"
    t.string "country"
    t.float "latitude"
    t.float "longitude"
    t.integer "type_id"
    t.integer "path_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["path_id"], name: "index_strolls_on_path_id"
    t.index ["type_id"], name: "index_strolls_on_type_id"
  end

  create_table "types", force: :cascade do |t|
    t.string "name"
    t.text "description"
    t.string "color"
    t.integer "stroll_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["stroll_id"], name: "index_types_on_stroll_id"
  end

end
