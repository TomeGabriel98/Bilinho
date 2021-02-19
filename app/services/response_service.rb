class ResponseService
  def initialize(params)
    @status = params[:status]
    @data = params[:data]
  end

  def send_response
    return { json: { status: @status, data: @data } }
  end
end
