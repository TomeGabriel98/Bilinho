class EnrollmentsController < ApplicationController
  def create
    begin
      @enrollment = Enrollment.new(enrollment_params)

      @enrollment.save!
    rescue ActiveRecord::ActiveRecordError => error
      @response = ResponseService.new({ status: "Error", data: error })
    else
      @invoice = InvoiceService.new(@enrollment)
      @invoice.create_invoice

      @response = ResponseService.new({ status: "Success", data: @enrollment })
    ensure
      render @response.send_response
    end
  end

  def show
    begin
      @enrollments = Enrollment.order('created_at DESC')
    rescue ActiveRecord::ActiveRecordError => error
      @response = ResponseService.new({ status: "Error", data: error })
    else
      @response = ResponseService.new({ status: "Success", data: @enrollments })
    ensure
      render @response.send_response
    end
  end

  def enrollment_params
    params.require(:enrollment).permit(:full_price, :max_payments, :payment_day, :course_name, :university_id, :student_id)
  end
end
