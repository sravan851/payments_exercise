class PaymentsController < ApplicationController

  before_action :loan, except: :show

  def index
    render json: loan.payments
  end

  def show
    render json: Payment.find(params[:id])
  end

  def create
    @payment = loan.payments.build(payment_params)

    if @payment.save
      render json: @payment, status: :created
    else
      render json: @payment.errors, status: 400
    end
  end

  private

  def loan
    @loan = Loan.find(params[:loan_id])
  end

  def payment_params
    params.require(:payment).permit(:amount, :date)
  end
end
