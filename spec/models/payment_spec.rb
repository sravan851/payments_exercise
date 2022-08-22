require 'rails_helper'

RSpec.describe Payment, type: :model do
  let!(:loan) { Loan.create!(funded_amount: 100.0) }
  subject { described_class.new(amount: 10, loan_id: loan.id, date: DateTime.now) }

  it "is valid with valid attributes" do
    expect(subject).to be_valid
  end

  it "is not valid without a amount" do
    subject.amount = nil
    expect(subject).to_not be_valid
  end

  it "auto populate a datetime if date is not present" do
    subject.date = nil
    expect(subject).to be_valid
  end

  it "returns an validation error if payment amount more than funded_amount" do
    subject.amount = 100.01
    expect(subject).to_not be_valid
  end

end
