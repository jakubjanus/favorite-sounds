require 'rails_helper'

RSpec::Matchers.define :be_valid_favorite_response do
  match do |actual_response_json|
    expect(actual_response_json).to have_key('sound_id')
    expect(actual_response_json).to have_key('folder_id')
  end
end


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

    it 'response is with 201 status' do
      expect(subject.status).to eq(201)
    end

    it 'response body has correct schema' do
      expect(response_json).to be_valid_favorite_response
    end

    it 'response body should include proper sound_id and folder' do
      expect(response_json['sound_id']).to eq(1)
      expect(response_json['folder_id']).to be_nil
    end
  end

  def response_json
    JSON.parse(response.body)
  end
end
