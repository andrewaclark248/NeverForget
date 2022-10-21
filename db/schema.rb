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

ActiveRecord::Schema.define(version: 2022_10_21_034314) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "keys", force: :cascade do |t|
    t.string "encrypted_key"
    t.string "encrypted_value"
    t.bigint "user_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["user_id"], name: "index_keys_on_user_id"
  end

  create_table "logins", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.bigint "user_id"
    t.string "auth_token"
    t.string "encrypted_otp_secret"
    t.string "encrypted_otp_secret_iv"
    t.string "encrypted_otp_secret_salt"
    t.integer "consumed_timestep"
    t.boolean "otp_required_for_login"
    t.string "mfa_email"
    t.string "mfa_phone"
    t.string "mfa_send_option"
    t.boolean "enable_tor"
    t.index ["email"], name: "index_logins_on_email", unique: true
    t.index ["reset_password_token"], name: "index_logins_on_reset_password_token", unique: true
    t.index ["user_id"], name: "index_logins_on_user_id"
  end

  create_table "orders", force: :cascade do |t|
    t.string "status"
    t.bigint "user_id"
    t.string "token"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.bigint "product_id"
    t.integer "price_cents", default: 0, null: false
    t.bigint "charge_id_id"
    t.string "error_message"
    t.index ["charge_id_id"], name: "index_orders_on_charge_id_id"
    t.index ["product_id"], name: "index_orders_on_product_id"
    t.index ["user_id"], name: "index_orders_on_user_id"
  end

  create_table "passwords", force: :cascade do |t|
    t.string "encrypted_password"
    t.string "expiration_date"
    t.bigint "user_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "username"
    t.string "pwd_strength"
    t.index ["user_id"], name: "index_passwords_on_user_id"
  end

  create_table "phones", force: :cascade do |t|
    t.string "phone_number"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.bigint "user_id"
    t.integer "active"
    t.index ["user_id"], name: "index_phones_on_user_id"
  end

  create_table "plans", force: :cascade do |t|
    t.string "name"
    t.integer "price_cents"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "stripe_price_id"
  end

  create_table "products", force: :cascade do |t|
    t.string "name"
    t.integer "price_cents"
    t.string "stripe_plan_name"
    t.string "paypal_plan_name"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "urls", force: :cascade do |t|
    t.string "name"
    t.bigint "password_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["password_id"], name: "index_urls_on_password_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "first"
    t.string "last"
    t.string "type"
    t.string "sid"
    t.string "auth_token"
    t.string "stripe_customer_id"
    t.string "subscription_status"
    t.string "current_period_end"
    t.bigint "plan_id"
    t.boolean "chrome_pwd_mng_toggle"
    t.string "chrome_ext_auto_logoff"
    t.index ["plan_id"], name: "index_users_on_plan_id"
  end

end
