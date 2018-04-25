RSpec.shared_examples 'successful favorite addition' do
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
    expect(response_json['folder_id']).to eq(folder_id)
  end
end
