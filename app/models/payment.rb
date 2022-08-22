class Payment < ActiveRecord::Base
  belongs_to :loan

  # validations for payment attributes
  validates :amount, :date, presence: true
  validate :validate_outstanding_balance_for_payment_amount

  before_validation :ensure_date_has_a_value

  private

  def ensure_date_has_a_value
    self.date = DateTime.now if date.blank?
  end

  def validate_outstanding_balance_for_payment_amount
    errors.add(:amount, "Please post a payment less than loan's outstanding balance") if amount && loan && amount > loan.try(:outstanding_balance)
  end
end
