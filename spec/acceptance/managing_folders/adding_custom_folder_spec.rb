require 'rails_helper'
require_relative '../matchers/all'

RSpec.describe 'Managing folders', type: :request do
  describe 'adding custom folder' do
    let(:number) { SecureRandom.random_number }
    let(:folder_name) { "Punk-rock sounds collection number #{number}" }
    let(:folder_params) do
      { name: folder_name }
    end

    before { post '/api/v1/folders', params: folder_params }

    subject { response }

    it 'response is with 201 status' do
      expect(subject.status).to eq(201)
    end

    it 'response body has correct schema' do
      expect(response_json).to be_valid_folder_response
    end

    it 'response body includes proper name' do
      expect(response_json['name']).to eq(folder_name)
    end

    describe 'fetching all folders' do
      before { get '/api/v1/folders' }

      it 'response includes just created folder' do
        json = response_json['folders'].find do |folder_json|
          folder_json['name'] == folder_name
        end
        expect(json).to_not be_nil
      end
    end
  end
end
