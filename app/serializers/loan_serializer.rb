class LoanSerializer < ActiveModel::Serializer
  # adding the attributes to reproduce the existing api response
  attributes :id, :funded_amount, :outstanding_balance, :created_at, :updated_at

  def outstanding_balance
    object.outstanding_balance
  end

end
