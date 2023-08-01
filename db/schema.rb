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

ActiveRecord::Schema.define(version: 2023_07_21_034819) do

  create_table "active_storage_attachments", charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.string "name", null: false
    t.string "record_type", null: false
    t.bigint "record_id", null: false
    t.bigint "blob_id", null: false
    t.datetime "created_at", null: false
    t.index ["blob_id"], name: "index_active_storage_attachments_on_blob_id"
    t.index ["record_type", "record_id", "name", "blob_id"], name: "index_active_storage_attachments_uniqueness", unique: true
  end

  create_table "active_storage_blobs", charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.string "key", null: false
    t.string "filename", null: false
    t.string "content_type"
    t.text "metadata"
    t.string "service_name", null: false
    t.bigint "byte_size", null: false
    t.string "checksum", null: false
    t.datetime "created_at", null: false
    t.index ["key"], name: "index_active_storage_blobs_on_key", unique: true
  end

  create_table "active_storage_variant_records", charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.bigint "blob_id", null: false
    t.string "variation_digest", null: false
    t.index ["blob_id", "variation_digest"], name: "index_active_storage_variant_records_uniqueness", unique: true
  end

  create_table "categories", charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.string "title"
    t.text "description"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "comments", charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.string "text"
    t.bigint "user_id", null: false
    t.bigint "video_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.integer "status", default: 0
    t.index ["user_id"], name: "index_comments_on_user_id"
    t.index ["video_id"], name: "index_comments_on_video_id"
  end

  create_table "feelings", charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.bigint "video_id", null: false
    t.integer "status"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["user_id"], name: "index_feelings_on_user_id"
    t.index ["video_id"], name: "index_feelings_on_video_id"
  end

  create_table "hash_tags", charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.string "title"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "histories", charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.bigint "video_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "search_text"
    t.integer "history_type"
    t.float "duration", default: 0.0
    t.float "current_time", default: 0.0
    t.index ["user_id"], name: "index_histories_on_user_id"
    t.index ["video_id"], name: "index_histories_on_video_id"
  end

  create_table "jwt_denylist", charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.string "jti", null: false
    t.datetime "exp", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["jti"], name: "index_jwt_denylist_on_jti"
  end

  create_table "member_notifications", charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.integer "noti_status"
    t.string "content"
    t.datetime "read_at"
    t.bigint "user_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.integer "noti_type"
    t.bigint "video_id"
    t.index ["user_id"], name: "index_member_notifications_on_user_id"
    t.index ["video_id"], name: "index_member_notifications_on_video_id"
  end

  create_table "own_playlist_videos", charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.bigint "own_playlist_id", null: false
    t.bigint "video_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["own_playlist_id"], name: "index_own_playlist_videos_on_own_playlist_id"
    t.index ["video_id"], name: "index_own_playlist_videos_on_video_id"
  end

  create_table "own_playlists", charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.string "title"
    t.string "description"
    t.integer "playlist_status"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.integer "playlist_type", default: 0
    t.index ["user_id"], name: "index_own_playlists_on_user_id"
  end

  create_table "playlist_by_topic_videos", charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.bigint "video_id", null: false
    t.bigint "playlist_by_topic_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["playlist_by_topic_id"], name: "index_playlist_by_topic_videos_on_playlist_by_topic_id"
    t.index ["video_id"], name: "index_playlist_by_topic_videos_on_video_id"
  end

  create_table "playlist_by_topics", charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.string "title"
    t.integer "playlist_type"
    t.integer "video_numbers", default: 0
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "playlist_videos", charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.bigint "video_id", null: false
    t.bigint "playlist_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["playlist_id"], name: "index_playlist_videos_on_playlist_id"
    t.index ["video_id"], name: "index_playlist_videos_on_video_id"
  end

  create_table "playlists", charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.string "title"
    t.string "description"
    t.bigint "hash_tag_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["hash_tag_id"], name: "index_playlists_on_hash_tag_id"
  end

  create_table "replies", charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.string "text"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.bigint "comment_id", null: false
    t.bigint "user_id"
    t.bigint "singer_id"
    t.index ["comment_id"], name: "index_replies_on_comment_id"
    t.index ["singer_id"], name: "index_replies_on_singer_id"
    t.index ["user_id"], name: "index_replies_on_user_id"
  end

  create_table "singer_notifications", charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.text "content"
    t.datetime "read_at"
    t.integer "noti_status"
    t.integer "noti_type"
    t.bigint "singer_id", null: false
    t.bigint "video_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["singer_id"], name: "index_singer_notifications_on_singer_id"
    t.index ["video_id"], name: "index_singer_notifications_on_video_id"
  end

  create_table "singer_replies", charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.string "text"
    t.bigint "singer_id", null: false
    t.bigint "comment_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["comment_id"], name: "index_singer_replies_on_comment_id"
    t.index ["singer_id"], name: "index_singer_replies_on_singer_id"
  end

  create_table "singers", charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.string "name"
    t.integer "age"
    t.integer "music_type"
    t.string "email"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "channel_name"
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.string "authentication_token", limit: 30
    t.string "description"
    t.index ["authentication_token"], name: "index_singers_on_authentication_token"
    t.index ["email"], name: "index_singers_on_email", unique: true
    t.index ["reset_password_token"], name: "index_singers_on_reset_password_token", unique: true
  end

  create_table "subscribes", charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.bigint "singer_id", null: false
    t.bigint "user_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.integer "status"
    t.index ["singer_id"], name: "index_subscribes_on_singer_id"
    t.index ["user_id"], name: "index_subscribes_on_user_id"
  end

  create_table "user_playlists", charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.bigint "playlist_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["playlist_id"], name: "index_user_playlists_on_playlist_id"
    t.index ["user_id"], name: "index_user_playlists_on_user_id"
  end

  create_table "users", charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.string "email"
    t.integer "age"
    t.string "name"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "authentication_token", limit: 30
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer "gender"
    t.index ["authentication_token"], name: "index_users_on_authentication_token", unique: true
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  create_table "video_hash_tags", charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.bigint "video_id", null: false
    t.bigint "hash_tag_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["hash_tag_id"], name: "index_video_hash_tags_on_hash_tag_id"
    t.index ["video_id"], name: "index_video_hash_tags_on_video_id"
  end

  create_table "videos", charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.string "title"
    t.text "description"
    t.integer "category_id"
    t.integer "views", default: 0
    t.bigint "singer_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.datetime "uploaded_video_at"
    t.integer "video_status"
    t.float "trending_score"
    t.integer "likes", default: 0
    t.integer "dislikes", default: 0
    t.datetime "update_trending_at"
    t.index ["singer_id"], name: "index_videos_on_singer_id"
  end

  create_table "watch_later_videos", charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.bigint "video_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["user_id"], name: "index_watch_later_videos_on_user_id"
    t.index ["video_id"], name: "index_watch_later_videos_on_video_id"
  end

  add_foreign_key "active_storage_attachments", "active_storage_blobs", column: "blob_id"
  add_foreign_key "active_storage_variant_records", "active_storage_blobs", column: "blob_id"
  add_foreign_key "comments", "users"
  add_foreign_key "comments", "videos"
  add_foreign_key "feelings", "users"
  add_foreign_key "feelings", "videos"
  add_foreign_key "histories", "users"
  add_foreign_key "histories", "videos"
  add_foreign_key "member_notifications", "users"
  add_foreign_key "member_notifications", "videos"
  add_foreign_key "own_playlist_videos", "own_playlists"
  add_foreign_key "own_playlist_videos", "videos"
  add_foreign_key "own_playlists", "users"
  add_foreign_key "playlist_by_topic_videos", "playlist_by_topics"
  add_foreign_key "playlist_by_topic_videos", "videos"
  add_foreign_key "playlist_videos", "playlists"
  add_foreign_key "playlist_videos", "videos"
  add_foreign_key "playlists", "hash_tags"
  add_foreign_key "replies", "comments"
  add_foreign_key "replies", "singers"
  add_foreign_key "replies", "users"
  add_foreign_key "singer_notifications", "singers"
  add_foreign_key "singer_notifications", "videos"
  add_foreign_key "singer_replies", "comments"
  add_foreign_key "singer_replies", "singers"
  add_foreign_key "subscribes", "singers"
  add_foreign_key "subscribes", "users"
  add_foreign_key "user_playlists", "playlists"
  add_foreign_key "user_playlists", "users"
  add_foreign_key "video_hash_tags", "hash_tags"
  add_foreign_key "video_hash_tags", "videos"
  add_foreign_key "videos", "singers"
  add_foreign_key "watch_later_videos", "users"
  add_foreign_key "watch_later_videos", "videos"
end
