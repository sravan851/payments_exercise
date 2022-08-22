require 'rails_helper'

RSpec.describe Loan, type: :model do
  let!(:loan) { Loan.create!(funded_amount: 100.0) }
  let!(:loan_1) { Loan.create!(funded_amount: 100.0) }
  let!(:payment_1) { Payment.create(amount: 10, loan_id: loan.id, date: DateTime.now)}
  let!(:payment_2) { Payment.create(amount: 20, loan_id: loan.id, date: DateTime.now)}

  it "returns funded_amount as outstanding balance if not payments made to loan" do
    expect(loan_1.outstanding_balance).to eq(loan_1.funded_amount)
  end

  it "deduct payment values from the funded_amount for outstanding balance" do
    expect(loan.outstanding_balance).to eq(70)
  end

end
