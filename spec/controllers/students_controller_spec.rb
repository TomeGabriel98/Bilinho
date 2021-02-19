require 'rails_helper'

RSpec.describe StudentsController, type: :request do
  fixtures :students

  describe 'GET /students' do
    let(:student) do Student.all end

    it 'shows the saved student' do
      get '/students/show'

      expect(response.body).to eq({ status: 'Success', data: student }.to_json)
      expect(response).to be_successful
    end
  end

  describe 'POST /students' do
    it 'creates successfully' do
      @params = {
        student: {
          name: 'Amandin',
          cpf: '05907883022',
          birthday: '21/09/1998',
          cellphone: 21988347664,
          gender: 'F',
          payment_method: 'Cartão',
        }
      }

      post '/students/new', params: @params
      @student = Student.last

      expect(@student.name).to eq(@params[:student][:name])
      expect(@student.cpf).to eq(@params[:student][:cpf])
      expect(@student.cellphone).to eq(@params[:student][:cellphone])
      expect(@student.gender).to eq(@params[:student][:gender])
      expect(@student.payment_method).to eq(@params[:student][:payment_method])
      expect(response).to be_successful
    end

    it 'do not create for uniqness validation' do
      @params = {
        student: {
          name: 'Aluno',
          cpf: '05907883022',
          birthday: '21/09/1998',
          cellphone: 21988347664,
          gender: 'F',
          payment_method: 'Cartão',
        }
      }

      post '/students/new', params: @params

      expect(response.body).to eq({ status: 'Error', data: 'Validation failed: Name has already been taken' }.to_json)
    end
  end
end
