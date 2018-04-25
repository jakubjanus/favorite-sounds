require 'rails_helper'
require_relative './matchers/all'

RSpec.describe 'Adding favorite sound', type: :request do
  describe 'Adding sound to default folder' do
    let(:sound_id) { SecureRandom.random_number(100) }
    let(:favorite_params) do
      { sound_id: sound_id }
    end

    before { post '/api/v1/favorites', params: favorite_params }

    subject { response }

    it 'response is with 201 status' do
      expect(subject.status).to eq(201)
    end

    it 'response body has correct schema' do
      expect(response_json).to be_valid_favorite_response
    end

    it 'response body includes proper sound_id' do
      expect(response_json['sound_id']).to eq(sound_id)
    end

    it 'response body includes default folder_id' do
      expect(response_json['folder_id']).to eq('root')
    end

    describe 'fetching root folder' do
      let(:expected_sound_item) do
        { 'sound_id' => sound_id, 'folder_id' => 'root' }
      end

      before { get '/api/v1/folders/root' }

      it 'response body includes just added sound' do
        expect(response_json['items']).to include(expected_sound_item)
      end
    end
  end
end
