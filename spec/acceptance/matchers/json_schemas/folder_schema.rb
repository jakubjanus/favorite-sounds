RSpec::Matchers.define :be_valid_folder_response do
  match do |actual_response_json|
    expect(actual_response_json).to have_key('id')
    expect(actual_response_json).to have_key('name')
  end
end
