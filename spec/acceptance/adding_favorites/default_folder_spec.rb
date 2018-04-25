require 'rails_helper'
require_relative '../matchers/all'
require_relative './shared_examples'

RSpec.describe 'Adding favorite sound', type: :request do
  describe 'Adding sound to default folder' do
    let(:sound_id) { SecureRandom.random_number(100) }
    let(:folder_id) { 'root' }
    let(:favorite_params) do
      { sound_id: sound_id }
    end

    before { post '/api/v1/favorites', params: favorite_params }

    subject { response }

    it_behaves_like 'successful favorite addition'

    describe 'fetching root folder' do
      let(:expected_sound_item) do
        { 'sound_id' => sound_id, 'folder_id' => 'root' }
      end

      before { get '/api/v1/folders/root' }

      it 'response body includes just added sound' do
        expect(response_json['items']).to include(expected_sound_item)
      end
    end

    context 'Error cases' do
      describe 'adding sound without its id' do
        let(:sound_id) { nil }

        it 'responds with 422 status' do
          expect(subject.status).to eq(422)
        end
      end

      describe 'adding same sound twice' do
        before { post '/api/v1/favorites', params: favorite_params }

        it 'responds with 422 status' do
          expect(subject.status).to eq(422)
        end
      end
    end
  end
end
