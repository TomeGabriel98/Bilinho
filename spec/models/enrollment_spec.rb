require 'rails_helper'

RSpec.describe Enrollment, type: :model do
  # faltou validar algumas coisas do model tbm, da uma olhada do Quero Pago (https://github.com/quero-edu/queropago/blob/master/spec/models/exportation_spec.rb)
  # e a forma como vc mocka o fixture da pra fazer de uma outra forma(melhor) tbm. Usar o FactoryBot é uma boa
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

    # aqui poderia ter um it ou um context para cada teste: When full_price is nil, blah blah... Isso deixa a leitura do teste mais dinâmica e fácil de enteder o que está sendo testado

    # tipo isso, mas melhor do que eu sugeri kkkk
    context 'when full_price is nil' do
      let(:enrollment) { Enrollment.new(full_price: nil, max_payments: 5, payment_day: 15, course_name: 'Administração', university_id: @university_id, student_id: @student_id) }

      it 'should raise error' do
        expect(enrollment.valid?).to be(false)
      end
    end

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
