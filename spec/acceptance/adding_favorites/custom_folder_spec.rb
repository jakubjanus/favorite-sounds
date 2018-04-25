require 'rails_helper'
require_relative '../matchers/all'
require_relative './shared_examples'

RSpec.describe 'Adding favorite sound', type: :request do
  describe 'Adding sound to custom folder' do
    let(:sound_id) { SecureRandom.random_number(100) }
    let(:folder_id) { SecureRandom.random_number(100) }
    let(:favorite_params) do
      {
        sound_id: sound_id,
        folder_id: folder_id
      }
    end

    before { post '/api/v1/favorites', params: favorite_params }

    subject { response }

    it_behaves_like 'successful favorite addition'
  end
end
