class StudentsController < ApplicationController
  def create
    begin
      @student = Student.new(student_params)

      @student.save!
    rescue ActiveRecord::ActiveRecordError => error
      @response = ResponseService.new({ status: "Error", data: error })
    else
      @response = ResponseService.new({ status: "Success", data: @student })
    ensure
      render @response.send_response
    end
  end

  def show
    begin
      @students = Student.order('created_at DESC')
    rescue ActiveRecord::ActiveRecordError => error
      @response = ResponseService.new({ status: "Error", data: error })
    else
      @response = ResponseService.new({ status: "Success", data: @students })
    ensure
      render @response.send_response
    end
  end

  def student_params
    params.require(:student).permit(:name, :cpf, :gender, :payment_method, :birthday, :cellphone)
  end
end
