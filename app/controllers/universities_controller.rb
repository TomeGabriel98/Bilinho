class UniversitiesController < ApplicationController
  def create
    begin
      @university = University.new(university_params)

      @university.save!
    rescue ActiveRecord::ActiveRecordError => error
      @response = ResponseService.new({ status: "Error", data: error })
    else  
      @response = ResponseService.new({ status: "Success", data: @university })
    ensure
      render @response.send_response
    end
  end

  def show
    begin
      @universities = University.order('created_at DESC')
    rescue ActiveRecord::ActiveRecordError => error
      @response = ResponseService.new({ status: "Error", data: error })
    else
      @response = ResponseService.new({ status: "Success", data: @universities })
    ensure
      render @response.send_response
    end
  end

  def university_params
    params.require(:university).permit(:name, :cnpj, :school_type)
  end
end
