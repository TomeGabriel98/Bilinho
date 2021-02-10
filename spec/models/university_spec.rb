require 'rails_helper'

RSpec.describe University, type: :model do
  describe 'when all university data is valid' do
    let(:universities) do
      [
        University.create(name: 'Escola', cnpj: nil, school_type: nil),
        University.create(name: 'Faculdade', cnpj: '123456789', school_type: 'universidade')
      ]
    end

    it 'validates successfully' do
      universities.each do |university|
        expect(university.valid?).to be(true)
      end
    end
  end

  describe 'when data is invalid' do
    University.create(name: 'Faculdade teste', cnpj: '1234567890', school_type: 'universidade')
    let(:universities) do
      [
        University.create(name: 'Faculdade A', cnpj: 'invalid_cnpj', school_type: 'creche'),
        University.create(name: nil, cnpj: '123456789', school_type: 'universidade'),
        University.create(name: 'Faculdade B', cnpj: '123456789', school_type: 'invalid_school'),
        University.create(name: 'Faculdade teste', cnpj: '1234', school_type: 'escola'),
        University.create(name: 'Nova ies', cnpj: '1234567890', school_type: 'escola')
      ]
    end

    it 'should raise error' do
      universities.each do |university|
        expect(university.valid?).to be(false)
      end
    end
  end
end
