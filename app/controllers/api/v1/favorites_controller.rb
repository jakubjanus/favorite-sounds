module Api
  module V1
    class FavoritesController < ApplicationController
      def create
        render json: { sound_id: 1, folder_id: nil }, status: :created
      end
    end
  end
end
