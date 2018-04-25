class ApplicationController < ActionController::API
  before_action :authenticate_user

  def authenticate_user
    @current_user = MockedUserAuthenticator.new(params).authenticate
  end

  class MockedUserAuthenticator
    def initialize(_params)
    end

    def authenticate
      OpenStruct.new(id: 1)
    end
  end
end
