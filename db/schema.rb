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

ActiveRecord::Schema[7.0].define(version: 2022_12_03_121937) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "answers", force: :cascade do |t|
    t.string "content"
    t.bigint "question_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["question_id"], name: "index_answers_on_question_id"
  end

  create_table "assessments", force: :cascade do |t|
    t.string "title"
    t.date "start_date"
    t.integer "duration"
    t.date "end_date"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "correct_answers", force: :cascade do |t|
    t.string "content"
    t.bigint "question_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["question_id"], name: "index_correct_answers_on_question_id"
  end

  create_table "feedbacks", force: :cascade do |t|
    t.string "content"
    t.bigint "user_id"
    t.bigint "question_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["question_id"], name: "index_feedbacks_on_question_id"
    t.index ["user_id"], name: "index_feedbacks_on_user_id"
  end

  create_table "invitations", force: :cascade do |t|
    t.string "link"
    t.bigint "user_id"
    t.bigint "assessment_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["assessment_id"], name: "index_invitations_on_assessment_id"
    t.index ["user_id"], name: "index_invitations_on_user_id"
  end

  create_table "questions", force: :cascade do |t|
    t.string "question"
    t.bigint "assessment_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["assessment_id"], name: "index_questions_on_assessment_id"
  end

  create_table "student_results", force: :cascade do |t|
    t.string "score"
    t.date "assessment_date"
    t.bigint "assessment_id"
    t.bigint "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["assessment_id"], name: "index_student_results_on_assessment_id"
    t.index ["user_id"], name: "index_student_results_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "first_name"
    t.string "last_name"
    t.string "email"
    t.string "role"
    t.string "password_digest"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_foreign_key "answers", "questions"
  add_foreign_key "correct_answers", "questions"
  add_foreign_key "feedbacks", "questions"
  add_foreign_key "feedbacks", "users"
  add_foreign_key "invitations", "assessments"
  add_foreign_key "invitations", "users"
  add_foreign_key "questions", "assessments"
  add_foreign_key "student_results", "assessments"
  add_foreign_key "student_results", "users"
end
