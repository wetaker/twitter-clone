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

ActiveRecord::Schema.define(version: 2021_06_25_233226) do

  create_table "followings", force: :cascade do |t|
    t.integer "follower_id", null: false
    t.integer "followed_user_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["followed_user_id"], name: "index_followings_on_followed_user_id"
    t.index ["follower_id"], name: "index_followings_on_follower_id"
  end

  create_table "likes", force: :cascade do |t|
    t.integer "liked_tweet_id", null: false
    t.integer "liker_id", null: false
    t.integer "liked_user_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["liked_tweet_id"], name: "index_likes_on_liked_tweet_id"
    t.index ["liked_user_id"], name: "index_likes_on_liked_user_id"
    t.index ["liker_id"], name: "index_likes_on_liker_id"
  end

  create_table "mentionings", force: :cascade do |t|
    t.integer "mentioned_user_id", null: false
    t.integer "mentioner_id", null: false
    t.integer "tweet_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["mentioned_user_id"], name: "index_mentionings_on_mentioned_user_id"
    t.index ["mentioner_id"], name: "index_mentionings_on_mentioner_id"
    t.index ["tweet_id"], name: "index_mentionings_on_tweet_id"
  end

  create_table "retweets", force: :cascade do |t|
    t.integer "retweeted_tweet_id", null: false
    t.integer "retweeter_id", null: false
    t.integer "retweeted_user_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["retweeted_tweet_id"], name: "index_retweets_on_retweeted_tweet_id"
    t.index ["retweeted_user_id"], name: "index_retweets_on_retweeted_user_id"
    t.index ["retweeter_id"], name: "index_retweets_on_retweeter_id"
  end

  create_table "tweets", force: :cascade do |t|
    t.text "body"
    t.string "title"
    t.integer "author_id"
    t.integer "parent_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["author_id"], name: "index_tweets_on_author_id"
    t.index ["parent_id"], name: "index_tweets_on_parent_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.string "handle", default: "", null: false
    t.string "username", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "followings", "users", column: "followed_user_id"
  add_foreign_key "followings", "users", column: "follower_id"
  add_foreign_key "likes", "tweets", column: "liked_tweet_id"
  add_foreign_key "likes", "users", column: "liked_user_id"
  add_foreign_key "likes", "users", column: "liker_id"
  add_foreign_key "mentionings", "tweets"
  add_foreign_key "mentionings", "users", column: "mentioned_user_id"
  add_foreign_key "mentionings", "users", column: "mentioner_id"
  add_foreign_key "retweets", "tweets", column: "retweeted_tweet_id"
  add_foreign_key "retweets", "users", column: "retweeted_user_id"
  add_foreign_key "retweets", "users", column: "retweeter_id"
  add_foreign_key "tweets", "tweets", column: "parent_id"
  add_foreign_key "tweets", "users", column: "author_id"
end
