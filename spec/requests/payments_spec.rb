# require 'rails_helper'
#
# RSpec.describe "Payments", type: :request do
#
#
#   describe "GET /index" do
#     pending "add some examples (or delete) #{__FILE__}"
#   end
# end


require 'rails_helper'

RSpec.describe "Payments", type: :request do
  let!(:loan) { Loan.create!(funded_amount: 100.0) }
  let!(:payment_1) { Payment.create(amount: 10, loan_id: loan.id, date: DateTime.now)}
  let!(:payment_2) { Payment.create(amount: 20, loan_id: loan.id, date: DateTime.now)}

  describe "GET /index" do
    it 'responds with a 200' do
      get loan_payments_url(loan.id)
      expect(response).to have_http_status(:ok)
      expect(response).to be_successful
    end
  end

  describe 'GET /show' do
    # let(:loan) { Loan.create!(funded_amount: 100.0) }

    it 'responds with a 200' do
      get loan_payment_url(loan_id: loan.id, id: payment_1.id)
      expect(response).to have_http_status(:ok)
      expect(response).to be_successful
    end

    context 'if the loan is not found' do
      it 'responds with a 404' do
        get loan_payment_url(loan_id: loan.id, id: "10000")
        expect(response).to have_http_status(:not_found)
      end
    end
  end


  describe "POST /create" do
    it 'responds with a 201' do
      post "/loans/#{loan.id}/payments", params: { payment: { amount: "10"} }
      expect(response).to have_http_status(:created)
      expect(response).to be_successful
    end

    it 'responds with a 400 if amount value not present' do
      post "/loans/#{loan.id}/payments", params: { payment: { amount: nil } }
      expect(response).to have_http_status(400)
      expect(response).to_not be_successful
    end

    it 'responds with a 400 if amount value greater than outstanding balance' do
      post "/loans/#{loan.id}/payments", params: { payment: { amount: 101 } }
      expect(response).to have_http_status(400)
      expect(response).to_not be_successful
    end
  end
end
