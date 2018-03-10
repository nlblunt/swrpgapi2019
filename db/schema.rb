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

ActiveRecord::Schema.define(version: 2018_07_21_033807) do

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

  create_table "armors", force: :cascade do |t|
    t.string "name"
    t.text "description"
    t.integer "defense"
    t.integer "soak"
    t.integer "price"
    t.text "notes"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "armors_pcs", force: :cascade do |t|
    t.integer "armor_id"
    t.integer "pc_id"
    t.index ["armor_id"], name: "index_armors_pcs_on_armor_id"
    t.index ["pc_id"], name: "index_armors_pcs_on_pc_id"
  end

  create_table "careers", force: :cascade do |t|
    t.string "name"
    t.text "description"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "careers_pcs", id: false, force: :cascade do |t|
    t.integer "career_id"
    t.integer "pc_id"
    t.index ["career_id"], name: "index_careers_pcs_on_career_id"
    t.index ["pc_id"], name: "index_careers_pcs_on_pc_id"
  end

  create_table "careers_skills", id: false, force: :cascade do |t|
    t.integer "career_id"
    t.integer "skill_id"
    t.index ["career_id"], name: "index_careers_skills_on_career_id"
    t.index ["skill_id"], name: "index_careers_skills_on_skill_id"
  end

  create_table "items", force: :cascade do |t|
    t.string "name"
    t.integer "price"
    t.text "description"
    t.text "notes"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "items_pcs", force: :cascade do |t|
    t.integer "item_id"
    t.integer "pc_id"
    t.index ["item_id"], name: "index_items_pcs_on_item_id"
    t.index ["pc_id"], name: "index_items_pcs_on_pc_id"
  end

  create_table "pcs", force: :cascade do |t|
    t.string "name"
    t.integer "xp"
    t.integer "credits"
    t.integer "brawn"
    t.integer "agility"
    t.integer "intellect"
    t.integer "cunning"
    t.integer "willpower"
    t.integer "presence"
    t.integer "wounds_thresh"
    t.integer "wounds_current"
    t.integer "strain_thresh"
    t.integer "strain_current"
    t.integer "critical"
    t.integer "soak"
    t.string "obligation_type"
    t.integer "obligation_amount"
    t.integer "player_id"
    t.integer "race_id"
    t.integer "career_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "avatar"
    t.string "status"
    t.index ["career_id"], name: "index_pcs_on_career_id"
    t.index ["player_id"], name: "index_pcs_on_player_id"
    t.index ["race_id"], name: "index_pcs_on_race_id"
  end

  create_table "pcs_sessions", force: :cascade do |t|
    t.integer "pc_id"
    t.integer "session_id"
    t.index ["pc_id"], name: "index_pcs_sessions_on_pc_id"
    t.index ["session_id"], name: "index_pcs_sessions_on_session_id"
  end

  create_table "pcs_skills", force: :cascade do |t|
    t.integer "pc_id"
    t.integer "skill_id"
    t.integer "rank", default: 0
    t.boolean "cskill", default: false
    t.index ["pc_id"], name: "index_pcs_skills_on_pc_id"
    t.index ["skill_id"], name: "index_pcs_skills_on_skill_id"
  end

  create_table "pcs_specializations", id: false, force: :cascade do |t|
    t.integer "pc_id"
    t.integer "specialization_id"
    t.index ["pc_id"], name: "index_pcs_specializations_on_pc_id"
    t.index ["specialization_id"], name: "index_pcs_specializations_on_specialization_id"
  end

  create_table "pcs_weapons", force: :cascade do |t|
    t.integer "pc_id"
    t.integer "weapon_id"
    t.index ["pc_id"], name: "index_pcs_weapons_on_pc_id"
    t.index ["weapon_id"], name: "index_pcs_weapons_on_weapon_id"
  end

  create_table "players", force: :cascade do |t|
    t.string "provider", default: "email", null: false
    t.string "uid", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer "sign_in_count", default: 0, null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string "current_sign_in_ip"
    t.string "last_sign_in_ip"
    t.string "confirmation_token"
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.string "unconfirmed_email"
    t.string "name"
    t.string "nickname"
    t.string "image"
    t.string "email"
    t.text "tokens"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["confirmation_token"], name: "index_players_on_confirmation_token", unique: true
    t.index ["email"], name: "index_players_on_email", unique: true
    t.index ["reset_password_token"], name: "index_players_on_reset_password_token", unique: true
    t.index ["uid", "provider"], name: "index_players_on_uid_and_provider", unique: true
  end

  create_table "races", force: :cascade do |t|
    t.string "name"
    t.integer "xp"
    t.integer "brawn"
    t.integer "agility"
    t.integer "intellect"
    t.integer "cunning"
    t.integer "willpower"
    t.integer "presence"
    t.integer "wounds_thresh"
    t.integer "strain_thresh"
    t.string "bonus"
    t.text "description"
    t.string "avatar"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "sessions", force: :cascade do |t|
    t.string "name"
    t.string "description"
    t.string "status"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "skills", force: :cascade do |t|
    t.string "name"
    t.string "attrib"
    t.text "description"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "skills_specializations", id: false, force: :cascade do |t|
    t.integer "skill_id"
    t.integer "specialization_id"
    t.index ["skill_id"], name: "index_skills_specializations_on_skill_id"
    t.index ["specialization_id"], name: "index_skills_specializations_on_specialization_id"
  end

  create_table "specializations", force: :cascade do |t|
    t.string "name"
    t.text "descriptin"
    t.integer "career_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["career_id"], name: "index_specializations_on_career_id"
  end

  create_table "weapons", force: :cascade do |t|
    t.string "name"
    t.integer "skill_id"
    t.integer "damage"
    t.integer "critical"
    t.string "range"
    t.integer "price"
    t.string "special"
    t.text "description"
    t.text "notes"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["skill_id"], name: "index_weapons_on_skill_id"
  end

end
