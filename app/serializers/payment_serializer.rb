class PaymentSerializer < ActiveModel::Serializer
  # adding the standard payment attributes
  attributes :id, :amount, :date, :loan_id, :created_at, :updated_at
end
