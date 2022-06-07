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

ActiveRecord::Schema[7.0].define(version: 2022_06_05_182831) do
  create_table "active_storage_attachments", charset: "utf8", force: :cascade do |t|
    t.string "name", null: false
    t.string "record_type", null: false
    t.bigint "record_id", null: false
    t.bigint "blob_id", null: false
    t.datetime "created_at", null: false
    t.index ["blob_id"], name: "index_active_storage_attachments_on_blob_id"
    t.index ["record_type", "record_id", "name", "blob_id"], name: "index_active_storage_attachments_uniqueness", unique: true
  end

  create_table "active_storage_blobs", charset: "utf8", force: :cascade do |t|
    t.string "key", null: false
    t.string "filename", null: false
    t.string "content_type"
    t.text "metadata"
    t.string "service_name", null: false
    t.bigint "byte_size", null: false
    t.string "checksum"
    t.datetime "created_at", null: false
    t.index ["key"], name: "index_active_storage_blobs_on_key", unique: true
  end

  create_table "active_storage_variant_records", charset: "utf8", force: :cascade do |t|
    t.bigint "blob_id", null: false
    t.string "variation_digest", null: false
    t.index ["blob_id", "variation_digest"], name: "index_active_storage_variant_records_uniqueness", unique: true
  end

  create_table "issue_statuses", charset: "utf8", force: :cascade do |t|
    t.string "name", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "issues", charset: "utf8", force: :cascade do |t|
    t.bigint "author_id", null: false
    t.bigint "assigned_to_id"
    t.bigint "project_id", null: false
    t.string "title", null: false
    t.text "description", null: false
    t.integer "status_id", default: 1, null: false
    t.date "start_date"
    t.datetime "closed_on"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["assigned_to_id"], name: "index_issues_on_assigned_to_id"
    t.index ["author_id"], name: "index_issues_on_author_id"
    t.index ["project_id"], name: "index_issues_on_project_id"
    t.index ["status_id"], name: "index_issues_on_status_id"
    t.index ["title"], name: "index_issues_on_title"
  end

  create_table "journals", charset: "utf8", force: :cascade do |t|
    t.text "body"
    t.bigint "issue_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "user_id", null: false
    t.index ["issue_id"], name: "index_journals_on_issue_id"
    t.index ["user_id"], name: "index_journals_on_user_id"
  end

  create_table "metal_content_analyses", charset: "utf8", force: :cascade do |t|
    t.text "project_name", null: false
    t.bigint "project_id", null: false
    t.date "create_date", null: false
    t.text "data", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.text "part_name"
    t.index ["project_id"], name: "index_metal_content_analyses_on_project_id"
  end

  create_table "news", charset: "utf8", force: :cascade do |t|
    t.string "title"
    t.text "description"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "user_id", null: false
    t.index ["user_id"], name: "index_news_on_user_id"
  end

  create_table "project_statuses", charset: "utf8", force: :cascade do |t|
    t.string "name", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["name"], name: "index_project_statuses_on_name"
  end

  create_table "projects", charset: "utf8", force: :cascade do |t|
    t.string "name", null: false
    t.text "description"
    t.string "homepage"
    t.date "launch_date", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "user_id", null: false
    t.bigint "project_status_id", default: 1, null: false
    t.index ["launch_date"], name: "index_projects_on_launch_date"
    t.index ["name"], name: "index_projects_on_name"
    t.index ["project_status_id"], name: "index_projects_on_project_status_id"
    t.index ["user_id"], name: "index_projects_on_user_id"
  end

  create_table "users", charset: "utf8", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.string "confirmation_token"
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.string "unconfirmed_email"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "name", null: false
    t.boolean "admin", default: false, null: false
    t.integer "status", default: 1, null: false
    t.index ["admin"], name: "index_users_on_admin"
    t.index ["confirmation_token"], name: "index_users_on_confirmation_token", unique: true
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
    t.index ["status"], name: "index_users_on_status"
  end

  add_foreign_key "active_storage_attachments", "active_storage_blobs", column: "blob_id"
  add_foreign_key "active_storage_variant_records", "active_storage_blobs", column: "blob_id"
  add_foreign_key "issues", "projects"
  add_foreign_key "issues", "users", column: "assigned_to_id"
  add_foreign_key "issues", "users", column: "author_id"
  add_foreign_key "journals", "issues"
  add_foreign_key "journals", "users"
  add_foreign_key "metal_content_analyses", "projects"
  add_foreign_key "news", "users"
  add_foreign_key "projects", "project_statuses"
  add_foreign_key "projects", "users"
end
