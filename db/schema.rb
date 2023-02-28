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

ActiveRecord::Schema[7.0].define(version: 0) do
  create_table "AUTHORITIES", id: false, charset: "utf8mb3", force: :cascade do |t|
    t.bigint "MEMBER_NO", null: false
    t.string "AUTHORITY", limit: 50, default: "ROLE_USER", null: false
    t.index ["MEMBER_NO"], name: "FK_MEMBER_NO_3"
  end

  create_table "MEMBERS", primary_key: "NO", id: :bigint, default: nil, charset: "utf8mb3", force: :cascade do |t|
    t.string "EMAIL", limit: 50, null: false
    t.string "PASSWORD", limit: 60, null: false
    t.datetime "CREATE_DATE", precision: nil, default: -> { "CURRENT_TIMESTAMP" }, null: false
    t.datetime "MODIFIED_DATE", precision: nil, default: -> { "CURRENT_TIMESTAMP" }, null: false
    t.string "DEL_FLAG", limit: 1, default: "0", null: false
    t.string "CERTIFY_FLAG", limit: 1, default: "0", null: false
    t.integer "GRADE", limit: 1, default: 0, null: false
  end

  create_table "MEMBER_WORD_RELATIONS", primary_key: "NO", id: :bigint, default: nil, charset: "utf8mb3", force: :cascade do |t|
    t.bigint "MEMBER_NO", null: false
    t.integer "WORD_NO", null: false
    t.index ["MEMBER_NO"], name: "FK_MEMBER_NO_2"
    t.index ["WORD_NO"], name: "FK_WORD_NO_2"
  end

  create_table "WORDBANKS", primary_key: "NO", id: :bigint, default: nil, charset: "utf8mb3", force: :cascade do |t|
    t.bigint "OWNER_NO", null: false
    t.string "NAME", limit: 50, null: false
    t.datetime "CREATE_DATE", precision: nil, default: -> { "CURRENT_TIMESTAMP" }, null: false
    t.datetime "MODIFIED_DATE", precision: nil, default: -> { "CURRENT_TIMESTAMP" }, null: false
    t.string "DEL_FLAG", limit: 2, default: "0", null: false
    t.index ["OWNER_NO"], name: "FK_MEMBER_NO"
  end

  create_table "WORDS", primary_key: "NO", id: :integer, default: nil, charset: "utf8mb3", force: :cascade do |t|
    t.string "WORD", limit: 50, null: false
    t.string "HURIGANA", limit: 50, comment: "한자읽는법"
    t.string "OKURIGANA", limit: 50, comment: "히라가나부분 읽는법"
    t.string "YOMIGANA", limit: 50, null: false, comment: "전체 읽는법"
    t.string "MEAN", limit: 50, null: false
    t.integer "GRADE", limit: 1, default: 0, null: false
  end

  create_table "WORD_WORDBANK_RELATIONS", primary_key: "NO", id: :bigint, default: nil, charset: "utf8mb3", force: :cascade do |t|
    t.bigint "OWNER_NO", null: false
    t.bigint "WORDBANK_NO", null: false
    t.string "NAME", limit: 50, null: false
    t.datetime "CREATE_DATE", precision: nil, default: -> { "CURRENT_TIMESTAMP" }, null: false
    t.datetime "MODIFIED_DATE", precision: nil, default: -> { "CURRENT_TIMESTAMP" }, null: false
    t.string "DEL_FLAG", limit: 2, default: "0", null: false
    t.index ["WORDBANK_NO"], name: "FK_WORDBANK_NO"
  end

  create_table "seq_mysql", id: false, charset: "utf8mb3", force: :cascade do |t|
    t.integer "id", null: false
    t.string "seq_name", limit: 50, null: false
  end

  add_foreign_key "AUTHORITIES", "MEMBERS", column: "MEMBER_NO", primary_key: "NO", name: "FK_MEMBER_NO_3"
  add_foreign_key "MEMBER_WORD_RELATIONS", "MEMBERS", column: "MEMBER_NO", primary_key: "NO", name: "FK_MEMBER_NO_2"
  add_foreign_key "MEMBER_WORD_RELATIONS", "WORDS", column: "WORD_NO", primary_key: "NO", name: "FK_WORD_NO_2"
  add_foreign_key "WORDBANKS", "MEMBERS", column: "OWNER_NO", primary_key: "NO", name: "FK_MEMBER_NO"
  add_foreign_key "WORD_WORDBANK_RELATIONS", "WORDBANKS", column: "WORDBANK_NO", primary_key: "NO", name: "FK_WORDBANK_NO"
end
