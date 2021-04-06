# Basicamente os mesmo comentários do que rolou no enrollments_controller_spec

require 'rails_helper'

RSpec.describe InvoicesController, type: :request do
  fixtures :invoices

  describe 'GET /invoices' do
    let(:invoices) do Invoice.where(enrollment_id: 1) end

    it 'shows the saved invoices for the given enrollment' do
      get '/invoices/1'

      expect(response.body).to eq({ status: 'Success', data: invoices }.to_json)
      expect(response).to be_successful
    end

    it 'shows an empty result when given enrollment do not exists' do
      get '/invoices/2'

      expect(response.body).to eq({ status: 'Success', data: [] }.to_json)
      expect(response).to be_successful
    end
  end
end
