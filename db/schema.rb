ActiveRecord::Schema.define(version: 2018_12_02_025927) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "boards", force: :cascade do |t|
    t.string "name"
    t.string "background"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "cards", force: :cascade do |t|
    t.string "title"
    t.string "description"
    t.string "comment"
    t.bigint "list_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "position"
    t.index ["list_id"], name: "index_cards_on_list_id"
  end

  create_table "lists", force: :cascade do |t|
    t.string "title"
    t.integer "position"
    t.bigint "board_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["board_id"], name: "index_lists_on_board_id"
  end

  create_table "user_boards", force: :cascade do |t|
    t.bigint "board_id"
    t.bigint "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["board_id"], name: "index_user_boards_on_board_id"
    t.index ["user_id"], name: "index_user_boards_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_foreign_key "cards", "lists"
  add_foreign_key "lists", "boards"
  add_foreign_key "user_boards", "boards"
  add_foreign_key "user_boards", "users"
end
