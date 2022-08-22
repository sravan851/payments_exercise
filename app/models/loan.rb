class Loan < ActiveRecord::Base
  has_many :payments, dependent: :destroy

  def outstanding_balance
      return funded_amount if payments.blank?
      funded_amount - payments.inject(0) { |sum, payment| sum + (payment&.amount) || 0 }
  end
end
