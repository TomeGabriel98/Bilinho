require 'rails_helper'

RSpec.describe Invoice, type: :model do
  fixtures :enrollments

  describe 'when all invoice data is valid' do
    @enrollment_id = Enrollment.find_by(course_name: 'Administração').id

    valid_invoice = Invoice.new(offered_price: 250.00, due_date: '12/02/2022', enrollment_id: @enrollment_id, status: 'Aberta')

    it 'validates successfully' do
      expect(valid_invoice.valid?).to be(true)
    end
  end

  describe 'when data is invalid' do
    @enrollment_id = Enrollment.find_by(course_name: 'Administração').id

    let(:invoices) do
      [
        Invoice.new(offered_price: '250.00', due_date: '12/02/2022', enrollment_id: @enrollment_id, status: 'Aberta'),
        Invoice.new(offered_price: nil, due_date: '12/02/2022', enrollment_id: @enrollment_id, status: 'Aberta'),
        Invoice.new(offered_price: 250.00, due_date: nil, enrollment_id: @enrollment_id, status: 'Aberta'),
        Invoice.new(offered_price: 250.00, due_date: '12/02/2022', enrollment_id: @enrollment_id, status: 'invalid status'),
        Invoice.new(offered_price: 250.00, due_date: '12/02/2022', enrollment_id: 12, status: 'Aberta')
      ]
    end

    it 'should raise error' do
      invoices.each do |invoice|
        expect(invoice.valid?).to be(false)
      end
    end
  end
end
