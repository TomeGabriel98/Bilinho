# gostei dos testes, mas só tem caminho feliz :smilling:
# é legal testar mais caminhos tristes, quando não é enviado uma param ou até quando é enviado errado, isso faz com que desenvolvemos um código mais complete, validando vários cenários
require 'rails_helper'

RSpec.describe EnrollmentsController, type: :request do
  fixtures :enrollments, :students, :universities

  describe 'GET /enrollments' do
    let(:enrollment) do Enrollment.all end

    it 'shows the saved enrollment' do
      get '/enrollments/show'

      expect(response.body).to eq({ status: 'Success', data: enrollment }.to_json)
      expect(response).to be_successful
    end
  end

  describe 'POST /enrollments' do
    university_id = University.find_by(name: 'Universidade').id
    student_id = Student.find_by(name: 'Aluno').id

    it 'creates successfully' do
      @params = {
        enrollment: {
          full_price: 500.50,
          max_payments: 3,
          payment_day: 20,
          course_name: 'Serviço Social',
          university_id: university_id,
          student_id: student_id,
        }
      }

      post '/enrollments/new', params: @params
      @enrollment = Enrollment.last

      expect(@enrollment.full_price).to eq(@params[:enrollment][:full_price])
      expect(@enrollment.max_payments).to eq(@params[:enrollment][:max_payments])
      expect(@enrollment.payment_day).to eq(@params[:enrollment][:payment_day])
      expect(@enrollment.course_name).to eq(@params[:enrollment][:course_name])
      expect(@enrollment.university_id).to eq(@params[:enrollment][:university_id])
      expect(@enrollment.student_id).to eq(@params[:enrollment][:student_id])
      expect(response).to be_successful
    end

    it 'do not create for foreign key violation' do
      @params = {
        enrollment: {
          full_price: 500.50,
          max_payments: 3,
          payment_day: 20,
          course_name: 'Serviço Social',
          university_id: 12,
          student_id: 1,
        }
      }

      post '/enrollments/new', params: @params

      expect(response.body).to eq({ status: 'Error', data: 'Validation failed: University must exist' }.to_json)
    end
  end
end
