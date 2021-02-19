class InvoicesController < ApplicationController
  def show
    begin
      @invoices = Invoice.where(enrollment_id: params[:id])
    rescue ActiveRecord::ActiveRecordError => error
      @response = ResponseService.new({ status: "Error", data: error })
    else
      @response = ResponseService.new({ status: "Success", data: @invoices })
    ensure
      render @response.send_response
    end
  end
end
