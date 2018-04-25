require 'rails_helper'
require_relative './matchers/all'

RSpec.describe 'Adding favorite sound', type: :request do
  describe 'Adding sound to default folder' do
    let(:favorite_params) do
      { sound_id: 1 }
    end

    before do
      post '/api/v1/favorites', params: favorite_params
    end

    subject { response }

    it 'response is with 201 status' do
      expect(subject.status).to eq(201)
    end

    it 'response body has correct schema' do
      expect(response_json).to be_valid_favorite_response
    end

    it 'response body includes proper sound_id' do
      expect(response_json['sound_id']).to eq(1)
    end

    it 'response body includes default folder_id' do
      expect(response_json['folder_id']).to eq('root')
    end
  end
end
