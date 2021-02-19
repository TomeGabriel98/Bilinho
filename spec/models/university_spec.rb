require 'rails_helper'

RSpec.describe University, type: :model do
  describe 'when all university data is valid' do
    let(:universities) do
      [
        University.new(name: 'Instituição', cnpj: nil, school_type: nil),
        University.new(name: 'Faculdade', cnpj: '73875198000120', school_type: 'Universidade')
      ]
    end

    it 'validates successfully' do
      universities.each do |university|
        expect(university.valid?).to be(true)
      end
    end
  end

  describe 'when data is invalid' do
    let(:universities) do
      [
        University.new(name: 'Faculdade A', cnpj: 'invalid_cnpj', school_type: 'Creche'),
        University.new(name: nil, cnpj: '73875198000120', school_type: 'Universidade'),
        University.new(name: 'Faculdade B', cnpj: '73875198000120', school_type: 'invalid_school'),
      ]
    end

    it 'should raise error' do
      universities.each do |university|
        expect(university.valid?).to be(false)
      end
    end
  end
end
