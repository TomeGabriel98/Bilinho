require 'rails_helper'

RSpec.describe Enrollment, type: :model do
  fixtures :students, :universities

  describe 'when all enrollment data is valid' do
    @university_id = University.find_by(name: 'Universidade').id
    @student_id = Student.find_by(name: 'Aluno').id

    valid_enrollment = Enrollment.new(full_price: 250.00, max_payments: 5, payment_day: 15, course_name: 'Administração', university_id: @university_id, student_id: @student_id)

    it 'validates successfully' do
      expect(valid_enrollment.valid?).to be(true)
    end
  end

  describe 'when data is invalid' do
    @university_id = University.find_by(name: 'Universidade').id
    @student_id = Student.find_by(name: 'Aluno').id

    let(:enrollments) do
      [
        Enrollment.new(full_price: '250.00', max_payments: 5, payment_day: 15, course_name: 'Administração', university_id: @university_id, student_id: @student_id),
        Enrollment.new(full_price: nil, max_payments: 5, payment_day: 15, course_name: 'Administração', university_id: @university_id, student_id: @student_id),
        Enrollment.new(full_price: 0, max_payments: 5, payment_day: 15, course_name: 'Administração', university_id: @university_id, student_id: @student_id),
        Enrollment.new(full_price: 250.00, max_payments: '5', payment_day: 15, course_name: 'Administração', university_id: @university_id, student_id: @student_id),
        Enrollment.new(full_price: 250.00, max_payments: nil, payment_day: 15, course_name: 'Administração', university_id: @university_id, student_id: @student_id),
        Enrollment.new(full_price: 250.00, max_payments: 0, payment_day: 15, course_name: 'Administração', university_id: @university_id, student_id: @student_id),
        Enrollment.new(full_price: 250.00, max_payments: 5, payment_day: '15', course_name: 'Administração', university_id: @university_id, student_id: @student_id),
        Enrollment.new(full_price: 250.00, max_payments: 5, payment_day: 0, course_name: 'Administração', university_id: @university_id, student_id: @student_id),
        Enrollment.new(full_price: 250.00, max_payments: 5, payment_day: nil, course_name: 'Administração', university_id: @university_id, student_id: @student_id),
        Enrollment.new(full_price: 250.00, max_payments: 5, payment_day: 15, course_name: nil, university_id: @university_id, student_id: @student_id),
        Enrollment.new(full_price: 250.00, max_payments: 5, payment_day: 15, course_name: 'Administração', university_id: 12, student_id: @student_id),
        Enrollment.new(full_price: 250.00, max_payments: 5, payment_day: 15, course_name: 'Administração', university_id: @university_id, student_id: 12),
      ]
    end

    it 'should raise error' do
      enrollments.each do |enrollment|
        expect(enrollment.valid?).to be(false)
      end
    end
  end
end
