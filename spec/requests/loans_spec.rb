require 'rails_helper'

RSpec.describe "Loans", type: :request do
  describe "GET /index" do
    it 'responds with a 200' do
      get loans_url
      expect(response).to have_http_status(:ok)
      expect(response).to be_successful
    end
  end

  describe '#show' do
    let(:loan) { Loan.create!(funded_amount: 100.0) }

    it 'responds with a 200' do
      get loan_url(loan.id)
      expect(response).to have_http_status(:ok)
      expect(response).to be_successful
    end

    context 'if the loan is not found' do
      it 'responds with a 404' do
        get loan_url("10000")
        expect(response).to have_http_status(:not_found)
      end
    end
  end
end
