require 'rails_helper'

RSpec.describe Student, type: :model do
  describe 'when all student data is valid' do
    valid_student = Student.new(name: 'Gabriel', cpf: '02912359058', gender: 'M', payment_method: 'Boleto')

    it 'validates successfully' do
      expect(valid_student.valid?).to be(true)
    end
  end

  describe 'when data is invalid' do
    let(:students) do
      [
        Student.new(name: nil, cpf: '02912359058', gender: 'M', payment_method: 'Boleto'),
        Student.new(name: 'Gabriel', cpf: nil, gender: 'M', payment_method: 'Boleto'),
        Student.new(name: 'Gabriel', cpf: '02912359058', gender: nil, payment_method: 'Boleto'),
        Student.new(name: 'Gabriel', cpf: '02912359058', gender: 'M', payment_method: nil),
        Student.new(name: 'Gabriel', cpf: 'invalid cpf', gender: 'M', payment_method: 'Boleto'),
        Student.new(name: 'Gabriel', cpf: '02912359058', gender: 'invalid gender', payment_method: 'Boleto'),
        Student.new(name: 'Gabriel', cpf: '02912359058', gender: 'M', payment_method: 'invalid payment')
      ]
    end

    it 'should raise error' do
      students.each do |student|
        expect(student.valid?).to be(false)
      end
    end
  end
end
