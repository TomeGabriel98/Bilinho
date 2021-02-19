require 'rails_helper'

RSpec.describe UniversitiesController, type: :request do
  fixtures :universities

  describe 'GET /universities' do
    let(:university) do University.all end

    it 'shows the saved university' do
      get '/universities/show'

      expect(response.body).to eq({ status: 'Success', data: university }.to_json)
      expect(response).to be_successful
    end
  end

  describe 'POST /universities' do
    it 'creates successfully' do
      @params = {
        university: {
          name: 'Creche',
          cnpj: '23222973000170',
          school_type: 'Creche',
        }
      }

      post '/universities/new', params: @params
      @university = University.last

      expect(@university.name).to eq(@params[:university][:name])
      expect(@university.cnpj).to eq(@params[:university][:cnpj])
      expect(@university.school_type).to eq(@params[:university][:school_type])
      expect(response).to be_successful
    end

    it 'do not create for uniqness validation' do
      @params = {
        university: {
          name: 'Universidade',
          cnpj: '23222973000170',
          school_type: 'Creche',
        }
      }

      post '/universities/new', params: @params

      expect(response.body).to eq({ status: 'Error', data: 'Validation failed: Name has already been taken' }.to_json)
    end
  end
end
