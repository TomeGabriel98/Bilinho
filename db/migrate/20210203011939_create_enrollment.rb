class CreateEnrollment < ActiveRecord::Migration[6.1]
  def change
    create_table :enrollments do |e|
      e.decimal :full_price
      e.integer :max_payments
      e.integer :payment_day
      e.string :course_name
      e.integer :university_id
      e.integer :student_id

      e.timestamps
    end
  end
end
