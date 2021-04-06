# Poderia ter testado os dois métodos: create_invoice() e get_initial_payment_day()
# Tbm poderia ter criado alguns cases quando não fossem enviados alguns parâmetros
require 'rails_helper'

RSpec.describe InvoiceService do
  fixtures :enrollments

  describe 'when creating invoice' do
    let(:enrollment) do Enrollment.find(2) end

    it 'creates the same amount of max_payments invoices' do
      @params = {
        full_price: enrollment.full_price,
        max_payments: enrollment.max_payments,
        payment_day: enrollment.payment_day,
        max_payments: enrollment.max_payments,
      }

      @invoice_service = InvoiceService.new(@params)
      @invoice_service.create_invoice

      @invoices = Invoice.where(enrollment_id: 2)
      expect(@invoices.length).to eq(enrollment.max_payments)
    end
  end
end
