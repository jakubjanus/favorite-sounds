require 'rails_helper'

RSpec.describe 'Adding favorite sound', type: :request do
  describe 'Adding sound to default folder' do
    let(:favorite_params) do
      {
        sound_id: 1
      }
    end

    before do
      post '/api/v1/favorites', params: favorite_params
    end

    subject { response }

    it 'response is with 200 status' do
      expect(subject.status).to eq(204)
    end
  end
end
