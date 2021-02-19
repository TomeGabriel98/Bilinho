class InvoiceService
  def initialize(params)
    @offered_price = params[:full_price] / params[:max_payments]
    @payment_day = params[:payment_day]
    @enrollment_id = Enrollment.last.id
    @max_payments = params[:max_payments]
    @status = "Aberta"
  end

  def create_invoice
    due_date = get_initial_payment_day()

    (1..@max_payments).each {
      Invoice.create!(offered_price: @offered_price, due_date: due_date, enrollment_id: @enrollment_id, status: @status)

      due_date = due_date.next_month
    }
  end

  def get_initial_payment_day
    today = Date.today

    if @payment_day <= today.mday
      today = today.next_month
    end

    return Date.new(today.year, today.month, @payment_day)
  end
end
