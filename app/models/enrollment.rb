class Enrollment < ApplicationRecord
  belongs_to :university, optional: false
  belongs_to :student, optional: false

  validates :full_price, numericality: { greater_than: 0 }, allow_nil: false
  validates :max_payments, numericality: { greater_than_or_equal_to: 1 }, allow_nil: false
  validates :payment_day, numericality: { greater_than_or_equal_to: 1, less_than_or_equal_to: 31 }, allow_nil: false
  validates :course_name, presence: true
end
