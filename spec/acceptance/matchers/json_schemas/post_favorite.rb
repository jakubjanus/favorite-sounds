RSpec::Matchers.define :be_valid_favorite_response do
  match do |actual_response_json|
    expect(actual_response_json).to have_key('sound_id')
    expect(actual_response_json).to have_key('folder_id')
  end
end
